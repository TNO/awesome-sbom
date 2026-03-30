---
title: "Dependency-Track"
date: '2026-03-30T00:00:00+02:00'
draft: false
developer: "OWASP"
link: "https://github.com/DependencyTrack/dependency-track"
first_release: "2018-03-27"
latest_release: "2026-03-09"
latest_version: "4.14.0"
functional_goals:
  creation:
    level: "partial"
    description: "Exports CycloneDX SBOMs and VEX documents for tracked projects; does not generate SBOMs from source code"
  ingestion:
    level: "full"
    description: "Ingests CycloneDX SBOMs via API or UI to populate the component portfolio"
  sharing:
    level: "full"
    description: "Exposes SBOMs and VEX via its REST API for downstream consumers and integrations"
  quality_assessment_validation:
    level: "partial"
    description: "Enforces security, license, and operational policies; checks for outdated and modified components but not SBOM structural quality"
  management:
    level: "full"
    description: "Tracks component usage across all project versions in the portfolio with a full web UI and policy engine"
  enrichment:
    level: "full"
    description: "Integrates with NVD, GitHub Advisories, OSV, Snyk, Trivy, VulnDB and others to enrich components with vulnerability metadata"
  vulnerability_assessment:
    level: "full"
    description: "Continuously matches components against multiple vulnerability databases and supports prioritisation via EPSS"
security_goals:
  authorization: "OAuth 2.0 + OpenID Connect (OIDC), Active Directory/LDAP, and API key support for fine-grained access control"
  integrity: "Detects modified components and tracks component usage across the portfolio to surface unexpected changes"
---

An OWASP Flagship intelligent component analysis platform that leverages SBOMs to identify and reduce software supply chain risk. Dependency-Track ingests CycloneDX SBOMs and enriches them by integrating with multiple vulnerability intelligence sources (NVD, GitHub Advisories, OSV, Snyk, Trivy, and more). It tracks component usage across an entire application portfolio, enforces security and license policies, and exports SBOMs and VEX documents. Its API-first design makes it well suited for integration into CI/CD pipelines.
