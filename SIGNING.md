# Release signatures

## Horizon registry signature

The Horizon registry requires Minisign. Register the last line of `signing/horizon-registry-minisign.pub` as the project public key:

```text
RWQPmYP3HRPOirhYnh4wqKYa00DgHlScywIHLOtVUJAbVPl+gEe3SyDw
```

Every registry package is accompanied by a `.minisig` file. Verify one with:

```bash
minisign -V \
  -p signing/horizon-registry-minisign.pub \
  -m dist/horizon_featherlight-1.0.0.hshader \
  -x dist/horizon_featherlight-1.0.0.hshader.minisig
```

The private key is kept outside the repository.

## GitHub release signature

The older GitHub release artifacts also retain their OpenSSH Ed25519 signatures. Their public key is `signing/featherlight-release.pub`, with fingerprint `SHA256:ws4vu/pha1RMvCH9JG6PHyxI0XAq7HeQ9VMBR8U0zjU`.
