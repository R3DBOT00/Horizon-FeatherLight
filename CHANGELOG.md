# Changelog

## Registry versions — 2026-11-18

- Aligns the Shader API 0.2 package manifest with registry version 1.0.0.
- Aligns the legacy Shader API 0.1 package manifest with registry version 1.1.0.
- Adds Horizon-compatible Minisign signatures for registry submission.

## 2.1.0-alpha.2 — 2026-11-18

- Raises the API 0.1 default night brightness from 60% to 75% for clearer terrain and structures after sunset.
- Adds verifiable Ed25519 signatures for release packages and the checksum manifest.

## 2.1.0-alpha.1 — 2026-11-18

- Adds a separate prerelease build for Horizon Shader API 0.1.
- Uses the stable gamma/SDR frame and does not require the experimental HDR-frame switch.
- Uses a separate pack ID so the API 0.1 alpha can coexist with the API 0.2 release.
- Retains the configurable presets, night brightness, atmosphere, and image controls in a flat menu.
- Replaces the unavailable API 0.2 shadow map with lightweight directional shading.
- Omits water-specific controls because API 0.1 does not identify fluid materials.
- Runtime-tested on Horizon 0.2.97 at approximately 60 FPS in the captured scene.

## 2.0.7 — 2026-11-18

- Restores the natural blue color of water at night.
- Keeps night water dark while retaining 90% of its color saturation.
- Avoids both the gray appearance of 2.0.6 and the neon appearance of earlier versions.

## 2.0.6 — 2026-11-18

- Prevents water from looking emissive or neon at night.
- Progressively reduces water brightness and blue saturation after sunset.
- Preserves the existing daytime water appearance and all selectable water styles.

## 2.0.5 — 2026-11-18

- Sets the default night brightness to 60%.
- Expands the Night brightness slider range to 40% through 100%.

## 2.0.4 — 2026-11-18

- Lowers the default night brightness from 90% to 70%.
- Keeps the full 65% to 100% Night brightness adjustment range.

## 2.0.3 — 2026-11-18

- Slightly darkens nights by 10% while preserving smooth dawn and dusk transitions.
- Adds a Night brightness slider from 65% to 100%, defaulting to 90%.
- Applies the adjustment consistently to terrain, water, and sky.

## 2.0.2 — 2026-11-18

- Removes striped shadow acne with slope-scaled receiver bias.
- Scales bias from the selected shadow resolution and distance.
- Adds a small depth bias while retaining the normal offset to reduce detached shadows.
- Matches the tested live preset by default: BALANCED, real shadows on, 512 resolution, 72-block distance, and full shadow strength.
- Keeps every additional aesthetic effect disabled by default.

## 2.0.1 — 2026-11-18

- Makes real shadows substantially darker and adds a Shadow strength slider.
- Keeps moonlit shadows visible instead of removing them with the daylight blend.
- Reduces normal bias so shadows stay attached to their casters.
- Smoothly fades the shadow-map boundary instead of popping abruptly.
- Raises the recommended defaults to 512 resolution and 72-block distance.
- Adds 96- and 128-block shadow-distance choices.

## 2.0.0 — 2026-11-17

- Combines POTATO, LOW, BALANCED, and QUALITY into one shader pack.
- Adds a native menu organized into Preset, Shadows, Atmosphere, Water, and Image pages.
- Adds three optional procedural cloud overlay styles.
- Adds optional sun glow, brighter stars, three water styles, cinematic warmth, and vignette.
- Uses BALANCED as the default preset while keeping every optional effect disabled by default.
- Adds an optional real shadow map with configurable resolution and distance.
- Removes custom volumetric fog and preserves Horizon's native distance fog.
- Optimizes PCF to one comparison in BALANCED and two comparisons in QUALITY.
