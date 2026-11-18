// Colour-only pass. Horizon retains its native distance fog.
fn post(input: PostInput) -> vec4<f32> {
    if !color_grade || quality_mode == 0u {
        return input.color;
    }
    var c = input.color.rgb;
    let warm = sun_low() * daylight() * (1.0 - frame.rain * 0.75);
    var warmth = 0.35;
    if quality_mode == 2u { warmth = 0.45; }
    if quality_mode >= 3u { warmth = 0.55; }
    if cinematic_warmth {
        c *= mix(vec3<f32>(1.0), vec3<f32>(1.095, 1.0, 0.905), warm * warmth);
    }
    if quality_mode >= 3u {
        c = c / (vec3<f32>(1.0) + c * 0.12) * 1.04;
    }
    c = mix(vec3<f32>(luminance(c)), c, saturation);
    c = max((c - 0.18) * contrast + 0.18, vec3<f32>(0.0));
    if vignette {
        let aspect = frame.resolution.x / frame.resolution.y;
        let edge = length((input.uv - 0.5) * vec2<f32>(aspect, 1.0));
        c *= 1.0 - smoothstep(0.38, 0.75, edge) * 0.055;
    }
    return vec4<f32>(c, input.color.a);
}
