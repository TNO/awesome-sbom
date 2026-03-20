---
title: "Syft"
date: '2025-10-28T14:09:00+01:00'
draft: false
developer: "Anchore"
link: "https://github.com/anchore/syft"
first_release: "2020-05-01"
latest_release: "2025-01-01"
latest_version: "v1.19.0"
functional_goals:
  Creation: "full"
  Signing: "full"
  Ingestion: "full"
  Signature_verification: "full"
  Conversion: "full"
  Vulnerability_assessment: "partial"
security_goals:
  Authenticity: "Signature creation and verification"
  Integrity: "Signature creation and verification"
  Non-repudiation: "Attestation creation and verification"
---

A CLI tool for generating SBOMs for containers and filesystems. Syft integrates natively with Grype for vulnerability scanning — vulnerability assessment is considered partial as it requires Grype as a companion tool.
