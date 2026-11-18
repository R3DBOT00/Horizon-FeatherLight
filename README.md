# Horizon FeatherLight

A configurable WGSL shader pack for Horizon, designed for Intel UHD integrated graphics. One package includes the **POTATO**, **LOW**, **BALANCED**, and **QUALITY** tiers and exposes every setting through Horizon's native in-game shader menu.

## Safe defaults

BALANCED is the default preset. Real shadows, color grading, additional clouds, water styles, and every other optional visual effect are disabled by default. The pack does not add custom volumetric fog; Horizon remains responsible for its native distance fog.

## In-game settings

Open **Options → Video Settings → Shaders → Shader Packs**, select **Horizon FeatherLight**, and choose **Shader Options**.

- **Preset:** POTATO, LOW, BALANCED, or QUALITY.
- **Shadows:** enable or disable the real shadow map, choose a 256/512/1024 resolution, and select a 32/48/72-block distance.
- **Atmosphere:** Soft, Layered, or Stylized procedural cloud overlays, sun glow, brighter stars, and adjustable night brightness.
- **Water:** Off, Azure, Tropical, or Deep Blue.
- **Image:** color grading, cinematic warmth, vignette, saturation, and contrast.

The controls use Horizon API `override` constants. Unselected visual branches are discarded when the rendering pipeline is compiled. Disabling **Real shadows** also prevents the shadow map and shadow pass from being created.

## Installation

Copy `dist/Horizon-FeatherLight-2.0.7.hshader` into Horizon's `shaderpacks` directory. On a standard Linux installation:

```bash
cp dist/Horizon-FeatherLight-2.0.7.hshader ~/.local/share/horizon/shaderpacks/
```

Select the pack from the in-game shader menu. Your choices are saved next to the package in the `shaderpacks` directory.

## API 0.1 alpha

`dist/Horizon-FeatherLight-API01-2.1.0-alpha.2.hshader` is a separate prerelease for older Horizon builds that serve Shader API 0.1. It uses the stable gamma/SDR frame, does not require `HORIZON_HDR_FRAME=float`, and has its own pack ID. API 0.1 uses a flat options menu and lightweight directional shading because those runtimes do not expose native menu pages, a shadow map, material normals, colored lights, emission, or fluid identity. Alpha 2 defaults to 75% night brightness for clearer terrain and structures. It was runtime-tested on Horizon 0.2.97. Current API 0.2-only nightlies refuse this compatibility package by design.

```bash
cp dist/Horizon-FeatherLight-API01-2.1.0-alpha.2.hshader ~/.local/share/horizon/shaderpacks/
```

## Recommended Intel UHD 620 settings

Start with BALANCED, 512/72 shadows, and all optional effects disabled. Use 256/48 shadows when additional performance is needed. QUALITY with 1024/96 shadows prioritizes image quality.

## Development

The packable source is in `shaderpack/`. Validate and rebuild the package with:

```bash
horizon-shader check shaderpack --json
horizon-shader pack shaderpack --out dist/Horizon-FeatherLight-2.0.7.hshader
sha256sum -c SHA256SUMS
```

The API 0.1 alpha source is in `shaderpack-api01/` and can be rebuilt with:

```bash
horizon-shader check shaderpack-api01 --json
horizon-shader pack shaderpack-api01 --out dist/Horizon-FeatherLight-API01-2.1.0-alpha.2.hshader
```

Release packages and `SHA256SUMS` have Ed25519 signatures. See [SIGNING.md](SIGNING.md) for the public key, fingerprint, and verification commands.

## Repository layout

```text
shaderpack/   Editable manifest and WGSL shader sources
shaderpack-api01/   API 0.1 alpha source
dist/         Ready-to-install package
docs/         Screenshots and additional documentation
SHA256SUMS    Published package integrity checksum
```

## License

MIT. See [LICENSE](LICENSE).
