override quality_mode: u32 = 2u;
override shadows: bool = true;
override shadow_resolution: u32 = 1u;
override shadow_distance: u32 = 1u;
override shadow_strength: f32 = 1.0;
override color_grade: bool = false;
override saturation: f32 = 1.0;
override contrast: f32 = 1.0;
override vignette: bool = false;
override cloud_style: u32 = 0u;
override sun_glow: bool = false;
override star_boost: bool = false;
override water_style: u32 = 0u;
override cinematic_warmth: bool = false;

fn luminance(c: vec3<f32>) -> f32 {
    return dot(c, vec3<f32>(0.2126, 0.7152, 0.0722));
}

fn daylight() -> f32 {
    return select(0.0, smoothstep(-0.1, 0.1, frame.sun_direction.y), frame.dimension == 0);
}

fn sun_low() -> f32 {
    return 1.0 - smoothstep(0.0, 0.35, abs(frame.sun_direction.y));
}

fn shadow_world_texel() -> f32 {
    var resolution = 256.0;
    if shadow_resolution == 1u { resolution = 512.0; }
    if shadow_resolution >= 2u { resolution = 1024.0; }
    var distance = 48.0;
    if shadow_distance == 1u { distance = 72.0; }
    if shadow_distance == 2u { distance = 96.0; }
    if shadow_distance >= 3u { distance = 128.0; }
    return (distance * 2.0) / resolution;
}
