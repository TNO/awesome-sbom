---
title: "OSS Review Toolkit (ORT)"
date: '2026-10-19T00:00:00+01:00'
draft: false
developer: "OSS Review Toolkit"
link: "https://github.com/oss-review-toolkit/ort"
first_release: "2017-10-01"
latest_release: "2026-10-15"
latest_version: "97.0.0"
functional_goals:
  creation:
    level: "full"
    description: "Generates CycloneDX and SPDX SBOMs, plus custom attribution documentation, from analyzed project dependencies across many package managers and build systems"
  ingestion:
    level: "partial"
    description: "Combines results from source code scanners and external advisories, but is not designed to re-process arbitrary third-party SBOMs"
  quality_assessment_validation:
    level: "full"
    description: "Its Evaluator stage runs policy-as-code checks for licensing, security advisories, and engineering standards against the gathered dependency data"
  vulnerability_assessment:
    level: "full"
    description: "The Advisor stage retrieves security advisories for all detected dependencies from configured vulnerability data services"
  management:
    level: "partial"
    description: "Orchestrates a full dependency review pipeline (Analyzer, Downloader, Scanner, Advisor, Evaluator, Reporter), but does not host a long-term SBOM inventory itself"
---

OSS Review Toolkit (ORT) is a FOSS policy automation and orchestration toolkit for managing open source software dependencies. It is organized as a pipeline of tools — Analyzer, Downloader, Scanner, Advisor, Evaluator, Reporter, and Notifier — that together determine project dependencies, detect licenses and copyrights, check for security advisories, evaluate custom policy rules, and produce CycloneDX or SPDX SBOMs and attribution documentation. ORT supports a very wide range of package managers and build systems, and can be used as a library, CLI, or CI integration, making it a general-purpose backbone for FOSS compliance pipelines rather than a single-ecosystem SBOM generator.
