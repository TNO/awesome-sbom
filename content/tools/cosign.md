---
title: "Cosign"
date: '2025-10-28T14:12:06+01:00'
draft: false
developer: "Sigstore"
link: "https://github.com/sigstore/cosign"
first_release: "2021-02-01"
latest_release: "2026-02-19"
latest_version: "v3.0.5"
functional_goals:
  signing:
    level: "full"
    description: "Signs any OCI artifact or file including SBOMs using keyless Sigstore signing or traditional key pairs"
  signature_verification:
    level: "full"
    description: "Verifies signatures against the Sigstore transparency log or provided public keys"
security_goals:
  authenticity: "Signature creation and verification"
  integrity: "Signature creation and verification"
  non_repudiation: "Attestation creation and verification"
---

With Cosign, it is possible to create and verify signatures for container images and other artifacts including SBOMs. It also has built-in support for in-toto attestations, enabling non-repudiation across the software supply chain.
