---
title: "Trivy"
date: '2026-10-19T00:00:00+01:00'
draft: false
developer: "Aqua Security"
link: "https://github.com/aquasecurity/trivy"
first_release: "2019-04-01"
latest_release: "2026-10-14"
latest_version: "v0.76.0"
functional_goals:
  creation:
    level: "full"
    description: "Generates CycloneDX and SPDX SBOMs from container images, filesystems, git repositories, and VMs across most popular languages and OS package managers"
  conversion:
    level: "partial"
    description: "Converts existing SBOMs between CycloneDX and SPDX for downstream reporting, but is not a dedicated format-conversion tool"
  vulnerability_assessment:
    level: "full"
    description: "Scans generated or ingested SBOMs against vulnerability databases as a first-class, primary feature"
  quality_assessment_validation:
    level: "partial"
    description: "Flags misconfigurations and licensing issues alongside vulnerabilities, but does not score SBOM completeness itself"
security_goals:
  authenticity: "Integrates with Sigstore/cosign-based ecosystems for verifying signed images it scans"
---

Trivy is a comprehensive, widely adopted open source security scanner from Aqua Security. Alongside vulnerability, misconfiguration, and secret scanning, it generates SBOMs for container images, filesystems, remote git repositories, and virtual machine images, covering most popular programming languages and OS package managers. Its SBOM output integrates with a broad ecosystem of CI/CD, GitHub Actions, and Kubernetes tooling. SBOM generation is one of several core scanning capabilities rather than its sole purpose, but it is mature, actively maintained, and extremely general in scope.
