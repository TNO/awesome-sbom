---
title: "Grype"
date: '2025-10-28T14:09:02+01:00'
draft: false
developer: "Anchore"
link: "https://github.com/anchore/grype"
first_release: "2020-05-01"
latest_release: "2025-01-01"
latest_version: "v0.87.0"
functional_goals:
  Ingestion: "full"
  Signature_verification: "full"
  Vulnerability_assessment: "full"
security_goals:
  Authenticity: "Signature verification"
  Integrity: "Signature verification"
---

Grype scans an environment for vulnerabilities based on input SBOMs. It integrates tightly with Syft and can accept SBOMs as input to perform vulnerability matching against a continuously updated database.
