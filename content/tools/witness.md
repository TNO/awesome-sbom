---
title: "Witness"
date: '2025-10-28T14:12:08+01:00'
draft: false
developer: "In-Toto"
link: "https://github.com/in-toto/witness"
first_release: "2021-10-01"
latest_release: "2026-01-13"
latest_version: "v0.10.2"
functional_goals:
  signing:
    level: "full"
    description: "Signs in-toto attestations capturing build steps, materials, and products using Sigstore or key-based signing"
  signature_verification:
    level: "full"
    description: "Verifies the full chain of in-toto attestations to confirm software was built as intended"
security_goals:
  authenticity: "Signature creation and verification"
  integrity: "Signature creation and verification"
  non_repudiation: "Attestation creation and verification"
---

Witness uses in-toto attestations to track and verify what happened during the software build process. It supports signing and verifying signatures, making it a strong contributor to supply chain integrity and non-repudiation goals.
