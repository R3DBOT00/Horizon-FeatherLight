fn material(input: MaterialInput) -> Surface {
    let vanilla = input.albedo * input.tint * vec4<f32>(input.lightmap, 1.0);
    if quality_mode == 0u {
        return Surface(vanilla);
    }
    let day = daylight();
    let night_scale = mix(night_brightness, 1.0, day);
    if quality_mode == 1u {
        return Surface(vec4<f32>(vanilla.rgb * night_scale, vanilla.a));
    }
    let directional_shading = 1.0 - (1.0 - input.light.y) * day * 0.126;
    let daylight_tint = vec3<f32>(1.0) + vec3<f32>(0.0261, 0.0087, -0.0174) * day;
    var base = vanilla.rgb * daylight_tint * directional_shading * (1.0 + input.light.y * day * 0.055);
    if quality_mode >= 3u {
        let luma = luminance(base);
        base = mix(vec3<f32>(luma), base, 1.064) + input.albedo.rgb * 0.025;
    }
    base *= night_scale;
    return Surface(vec4<f32>(base, vanilla.a));
}
