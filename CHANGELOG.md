# Changelog

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
