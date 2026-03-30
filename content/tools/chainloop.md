---
title: "Chainloop"
date: '2025-10-28T14:12:39+01:00'
draft: false
developer: "Chainloop (contributors include Google, OpenSSF, OWASP)"
link: "https://github.com/chainloop-dev/chainloop"
first_release: "2023-03-01"
latest_release: "2026-03-26"
latest_version: "v1.88.1"
functional_goals:
  signing:
    level: "full"
    description: "Wraps artifacts in signed in-toto attestations using Sigstore or key-based signing"
  ingestion:
    level: "full"
    description: "Ingests SBOMs and other artifacts as attestation subjects in CI/CD workflows"
  signature_verification:
    level: "full"
    description: "Verifies attestation signatures before releasing artifacts downstream"
  management:
    level: "full"
    description: "Provides a central control plane for managing attestations, policies, and artifact metadata across pipelines"
security_goals:
  authenticity: "Signature verification"
  integrity: "Signature verification"
  non_repudiation: "Attestation verification"
  authorization: "Role-based Access Control"
  availability: "Content Addressable Storage API"
---

A repository for storing various types of artifacts. Because it supports signatures and attestations, it contributes to many security goals. Chainloop's storage can be implemented using a Content Addressable Storage API, making data tamper-proof. It also offers integration with Dependency-Track and GUAC.
