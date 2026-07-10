---
title: "CycloneDX CLI"
date: '2025-10-28T12:03:40+01:00'
draft: false
developer: "OWASP"
link: "https://github.com/CycloneDX/cyclonedx-cli"
first_release: "2022-10-01"
latest_release: "2026-02-10"
latest_version: "v0.30.0"
functional_goals:
  creation:
    level: "full"
    description: "Merges multiple existing SBOMs into a new CycloneDX SBOM; does not generate SBOMs from source code"
  signing:
    level: "full"
    description: "Signs SBOMs using key pairs or Sigstore, producing detached signatures"
  ingestion:
    level: "full"
    description: "Reads CycloneDX SBOMs in JSON or XML for validation, merging, and conversion"
  signature_verification:
    level: "full"
    description: "Verifies SBOM signatures using provided public keys or Sigstore"
  quality_assessment_validation:
    level: "full"
    description: "Validates SBOMs against the CycloneDX schema specification"
  conversion:
    level: "full"
    description: "Converts between CycloneDX JSON and XML, and between CycloneDX and SPDX tag-value format"
security_goals:
  authenticity: "Signature creation and verification"
  integrity: "Signature creation and verification"
---

A CLI tool to perform various operations on SBOMs in CycloneDX format. Compared to `sbom-utility`, it can create and verify signatures, but it does not have the capabilities to query SBOMs for vulnerabilities or components.
