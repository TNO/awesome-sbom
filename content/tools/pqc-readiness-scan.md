---
title: "PQC Readiness Scan"
date: '2026-10-10T12:00:00+01:00'
draft: false
developer: "FRACTAL AI S.A.S."
link: "https://github.com/johnInarti/pqc-readiness-action"
first_release: "2026-10-10"
latest_release: "2026-10-10"
latest_version: "v1.0.0"
functional_goals:
  creation:
    level: "partial"
    description: "Generates a CycloneDX 1.6 CBOM of cryptographic assets from static source and manifest analysis; it does not produce a component SBOM"
---

A GitHub Action that statically scans a repository for quantum-vulnerable
cryptography — RSA, ECDSA, ECDH/X25519, Ed25519/Ed448, finite-field
Diffie-Hellman and DSA, including committed SSH and X.509 key material and
manifest dependencies that implement those primitives — and writes a CycloneDX
1.6 CBOM (Cryptographic Bill of Materials, ECMA-424) of `cryptographic-asset`
components. It is aimed at the inventory step that NIST IR 8547 timelines
require, deprecating those algorithms after 2030 and disallowing them after
2035.

Being a static scan, it is not a proof of absence: it cannot see dynamic
loading, vendored binaries or hardware modules, so zero findings means nothing
matched rather than nothing is present. It skips directories such as `vendor`
and `node_modules` by default, records which names were skipped in the CBOM
itself, and prints a warning plus a run annotation whenever its own coverage was
truncated. It is not a compliance certification. The scan runs entirely in the
caller's runner, uploads nothing, and has no third-party dependencies.
