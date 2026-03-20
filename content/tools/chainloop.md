---
title: "Chainloop"
date: '2025-10-28T14:12:39+01:00'
draft: false
developer: "Chainloop (contributors include Google, OpenSSF, OWASP)"
link: "https://github.com/chainloop-dev/chainloop"
first_release: "2023-03-01"
latest_release: "2025-02-01"
latest_version: "v0.171.0"
functional_goals:
  Signing: "full"
  Ingestion: "full"
  Signature_verification: "full"
  Management: "full"
security_goals:
  Authenticity: "Signature verification"
  Integrity: "Signature verification"
  Non-repudiation: "Attestation verification"
  Authorization: "Role-based Access Control"
  Availability: "Content Addressable Storage API"
---

A repository for storing various types of artifacts. Because it supports signatures and attestations, it contributes to many security goals. Chainloop's storage can be implemented using a Content Addressable Storage API, making data tamper-proof. It also offers integration with Dependency-Track and GUAC.
