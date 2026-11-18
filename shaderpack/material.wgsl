fn shadow_visibility(position: vec3<f32>, normal: vec3<f32>) -> f32 {
    if !shadows || quality_mode < 2u || frame.has_shadow == 0u {
        return 1.0;
    }
    let light_facing = clamp(abs(dot(normalize(normal), normalize(frame.sun_direction))), 0.0, 1.0);
    let slope = 1.0 - light_facing;
    let normal_bias = 0.022 + shadow_world_texel() * 0.22 * slope;
    let p = shadow_position(position + normal * normal_bias);
    let inside = all(p.xy >= vec2<f32>(0.0)) && all(p.xy <= vec2<f32>(1.0));
    if !inside {
        return 1.0;
    }
    let compare_depth = p.z - (0.00020 + slope * 0.00035);
    let edge = min(min(p.x, 1.0 - p.x), min(p.y, 1.0 - p.y));
    let edge_fade = smoothstep(0.0, 0.055, edge);
    if quality_mode == 2u {
        let sample = textureSampleCompareLevel(shadow_map, shadow_sampler, p.xy, compare_depth);
        return mix(1.0, sample, edge_fade);
    }
    let texel = vec2<f32>(1.0) / vec2<f32>(textureDimensions(shadow_map));
    let a = textureSampleCompareLevel(shadow_map, shadow_sampler, p.xy + texel * vec2<f32>(-0.45, -0.45), compare_depth);
    let b = textureSampleCompareLevel(shadow_map, shadow_sampler, p.xy + texel * vec2<f32>(0.45, 0.45), compare_depth);
    return mix(1.0, (a + b) * 0.5, edge_fade);
}

fn material(input: MaterialInput) -> Surface {
    let vanilla = input.albedo * input.tint * vec4<f32>(input.lightmap, 1.0);
    if quality_mode == 0u {
        return Surface(vanilla);
    }
    let day = daylight();
    let luma = luminance(vanilla.rgb);
    var local_saturation = 1.04;
    var look_strength = 0.34;
    if quality_mode == 2u {
        local_saturation = 1.06;
        look_strength = 0.58;
    }
    if quality_mode >= 3u {
        local_saturation = 1.08;
        look_strength = 0.80;
    }
    let saturated = mix(vec3<f32>(luma), vanilla.rgb, local_saturation);
    let looked = mix(vanilla.rgb, saturated, look_strength);
    let sun_facing = max(dot(input.normal, frame.sun_direction), 0.0) * day * input.light.y;
    let daylight_tint = mix(vec3<f32>(1.0), vec3<f32>(1.065, 1.020, 0.955), day * look_strength);
    let visibility = shadow_visibility(input.position, input.normal);
    let shadow_tint = mix(vec3<f32>(0.18, 0.23, 0.34), vec3<f32>(1.0), visibility);
    let day_night_strength = mix(0.70, 1.0, day) * shadow_strength;
    let base_shadowed = looked * daylight_tint * mix(vec3<f32>(1.0), shadow_tint, day_night_strength);
    let rich_lighting = input.albedo.rgb * (input.emission * 0.18 + input.colored_light * 0.20);
    let extra = select(vec3<f32>(0.0), rich_lighting, quality_mode >= 3u);
    let base = base_shadowed * (1.0 + sun_facing * 0.075) + extra;
    var water = base;
    if water_style == 1u { water = base * vec3<f32>(0.76, 0.96, 1.22) + vec3<f32>(0.0, 0.035, 0.075); }
    if water_style == 2u { water = base * vec3<f32>(0.70, 1.06, 1.12) + vec3<f32>(0.0, 0.055, 0.050); }
    if water_style == 3u { water = base * vec3<f32>(0.58, 0.78, 1.18) + vec3<f32>(0.0, 0.018, 0.082); }
    let rgb = select(base, water, input.fluid == 1u && water_style != 0u);
    return Surface(vec4<f32>(rgb, vanilla.a));
}
