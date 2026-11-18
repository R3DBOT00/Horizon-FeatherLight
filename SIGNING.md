# Release signatures

Official Horizon FeatherLight release artifacts are signed with the Ed25519 public key in `signing/featherlight-release.pub`.

Public key fingerprint:

```text
SHA256:ws4vu/pha1RMvCH9JG6PHyxI0XAq7HeQ9VMBR8U0zjU
```

The private signing key is kept outside this repository. Verify a downloaded artifact with OpenSSH 8.2 or newer:

```bash
ssh-keygen -Y verify \
  -f signing/allowed_signers \
  -I horizon-featherlight \
  -n file \
  -s Horizon-FeatherLight-API01-2.1.0-alpha.2.hshader.sig \
  < Horizon-FeatherLight-API01-2.1.0-alpha.2.hshader
```

Verify the signed checksum manifest in the same way, then verify every listed file:

```bash
ssh-keygen -Y verify -f signing/allowed_signers -I horizon-featherlight -n file -s SHA256SUMS.sig < SHA256SUMS
sha256sum -c SHA256SUMS
```
