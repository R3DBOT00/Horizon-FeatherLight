fn sky(input: SkyInput) -> vec4<f32> {
    let d = input.direction;
    let day = daylight();
    let clear_day = day * (1.0 - frame.rain * 0.8);
    let horizon = 1.0 - smoothstep(0.0, 0.50, abs(d.y));
    let up = smoothstep(-0.12, 0.88, d.y);
    let toward_sun = max(dot(d, frame.sun_direction), 0.0);
    let halo = toward_sun * toward_sun * (0.25 + horizon * 0.35);
    let atmosphere = mix(vec3<f32>(0.54, 0.71, 1.04), vec3<f32>(0.075, 0.25, 0.76), up);
    var strength = 0.0;
    if quality_mode == 1u { strength = 0.18; }
    if quality_mode == 2u { strength = 0.24; }
    if quality_mode >= 3u { strength = 0.31; }
    var graded = mix(input.color.rgb, atmosphere, clear_day * strength);
    let warm = select(vec3<f32>(0.0), vec3<f32>(0.20, 0.085, 0.018) * halo * day * max(strength, 0.18), sun_glow);
    let cloud_band = smoothstep(0.01, 0.16, d.y) * (1.0 - smoothstep(0.34, 0.72, d.y));
    let drift = frame.time * 0.025;
    let soft_noise = sin(d.x * 18.0 + drift) * sin(d.z * 14.0 - drift * 0.7);
    let fine_noise = sin(d.x * 41.0 - drift * 1.3) * sin(d.z * 35.0 + drift);
    var cloud_mask = 0.0;
    if cloud_style == 1u { cloud_mask = smoothstep(0.18, 0.72, soft_noise * 0.5 + 0.5); }
    if cloud_style == 2u { cloud_mask = smoothstep(0.12, 0.68, soft_noise * 0.36 + fine_noise * 0.18 + 0.5); }
    if cloud_style == 3u { cloud_mask = step(0.58, soft_noise * 0.5 + 0.5); }
    graded = mix(graded, vec3<f32>(0.92, 0.95, 1.0), cloud_mask * cloud_band * clear_day * 0.34);
    let night_boost = select(1.0, mix(1.22, 1.0, day), star_boost);
    let night_scale = mix(night_brightness, 1.0, day);
    return vec4<f32>((graded + warm) * night_boost * night_scale, input.color.a);
}
