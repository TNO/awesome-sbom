---
title: "CycloneDX Generator (cdxgen)"
date: '2025-10-28T13:48:48+01:00'
draft: false
developer: "OWASP"
link: "https://github.com/CycloneDX/cdxgen"
first_release: "2017-06-01"
latest_release: "2026-03-25"
latest_version: "v12.1.3"
functional_goals:
  creation:
    level: "full"
    description: "Generates CycloneDX SBOMs from source code, container images, and package manifests across 20+ language ecosystems"
  signing:
    level: "full"
    description: "Signs SBOMs and attestations using Sigstore cosign"
  ingestion:
    level: "full"
    description: "Reads and processes existing CycloneDX SBOMs as input"
  signature_verification:
    level: "full"
    description: "Verifies SBOM signatures and attestations via cosign"
  quality_assessment_validation:
    level: "full"
    description: "Validates SBOMs against the CycloneDX schema and assesses component completeness"
  conversion:
    level: "full"
    description: "Converts between CycloneDX and SPDX formats"
  management:
    level: "partial"
    description: "Server mode provides a BOM API for serving and querying SBOMs, but lacks full lifecycle management"
security_goals:
  authenticity: "Signature creation and verification"
  integrity: "Signature creation and verification"
---

A CLI tool to generate BOMs with all project dependencies, accompanied by various functionalities. cdxgen supports a wide range of languages and package managers, making it one of the most versatile SBOM generation tools available.
