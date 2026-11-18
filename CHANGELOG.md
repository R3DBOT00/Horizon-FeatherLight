# Changelog

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
