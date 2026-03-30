---
title: "Syft"
date: '2025-10-28T14:09:00+01:00'
draft: false
developer: "Anchore"
link: "https://github.com/anchore/syft"
first_release: "2020-05-01"
latest_release: "2026-03-19"
latest_version: "v1.42.3"
functional_goals:
  creation:
    level: "full"
    description: "Generates SBOMs for containers and filesystems in CycloneDX and SPDX formats across many language ecosystems"
  signing:
    level: "full"
    description: "Signs SBOMs and container images using Sigstore cosign"
  ingestion:
    level: "full"
    description: "Reads existing SBOMs as input for conversion or re-processing"
  signature_verification:
    level: "full"
    description: "Verifies cosign signatures on SBOMs and container images"
  conversion:
    level: "full"
    description: "Converts between CycloneDX and SPDX formats"
  vulnerability_assessment:
    level: "partial"
    description: "Integrates natively with Grype for vulnerability scanning; assessment requires Grype as a companion tool"
security_goals:
  authenticity: "Signature creation and verification"
  integrity: "Signature creation and verification"
  non_repudiation: "Attestation creation and verification"
---

A CLI tool for generating SBOMs for containers and filesystems. Syft integrates natively with Grype for vulnerability scanning — vulnerability assessment is considered partial as it requires Grype as a companion tool.
