---
title: "CycloneDX CLI"
date: '2025-10-28T12:03:40+01:00'
draft: false
developer: "OWASP"
link: "https://github.com/CycloneDX/cyclonedx-cli"
first_release: "2022-10-01"
latest_release: "2024-11-01"
latest_version: "v0.27.2"
functional_goals:
  Creation: "full"
  Signing: "full"
  Ingestion: "full"
  Signature_verification: "full"
  Quality_assessment_validation: "full"
  Conversion: "full"
security_goals:
  Authenticity: "Signature creation and verification"
  Integrity: "Signature creation and verification"
---

A CLI tool to perform various operations on SBOMs in CycloneDX format. Compared to `sbom-utility`, it can create and verify signatures, but it does not have the capabilities to query SBOMs for vulnerabilities or components.
