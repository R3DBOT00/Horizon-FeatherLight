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
    let sun_facing = input.light.y * day;
    let daylight_tint = mix(vec3<f32>(1.0), vec3<f32>(1.045, 1.015, 0.970), day * look_strength);
    let directional = mix(0.82, 1.0, input.light.y);
    let directional_shading = select(1.0, mix(1.0, directional, day * 0.70), quality_mode >= 2u);
    let extra = select(vec3<f32>(0.0), input.albedo.rgb * 0.025, quality_mode >= 3u);
    let night_scale = mix(night_brightness, 1.0, day);
    let base = (looked * daylight_tint * directional_shading * (1.0 + sun_facing * 0.055) + extra) * night_scale;
    return Surface(vec4<f32>(base, vanilla.a));
}
