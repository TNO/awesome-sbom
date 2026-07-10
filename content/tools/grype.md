---
title: "Grype"
date: '2025-10-28T14:09:02+01:00'
draft: false
developer: "Anchore"
link: "https://github.com/anchore/grype"
first_release: "2020-05-01"
latest_release: "2026-03-19"
latest_version: "v0.110.0"
functional_goals:
  ingestion:
    level: "full"
    description: "Reads CycloneDX and SPDX SBOMs as input for vulnerability scanning"
  signature_verification:
    level: "full"
    description: "Verifies cosign signatures on container images before scanning"
  vulnerability_assessment:
    level: "full"
    description: "Matches SBOM components against a continuously updated vulnerability database covering NVD, GitHub Advisories, and more"
security_goals:
  authenticity: "Signature verification"
  integrity: "Signature verification"
---

Grype scans an environment for vulnerabilities based on input SBOMs. It integrates tightly with Syft and can accept SBOMs as input to perform vulnerability matching against a continuously updated database.
