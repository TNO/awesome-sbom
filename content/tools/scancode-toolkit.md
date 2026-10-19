---
title: "ScanCode Toolkit"
date: '2026-10-19T00:00:00+01:00'
draft: false
developer: "nexB / AboutCode"
link: "https://github.com/nexB/scancode-toolkit"
first_release: "2015-07-01"
latest_release: "2026-01-15"
latest_version: "v32.5.0"
functional_goals:
  creation:
    level: "full"
    description: "Scans source code and binaries to detect package manifests, dependencies, licenses, and copyrights, and can export results as CycloneDX or SPDX SBOMs"
  quality_assessment_validation:
    level: "full"
    description: "Considered a reference tool for license detection accuracy, performing full text comparison against a license database rather than approximate pattern matching"
  enrichment:
    level: "partial"
    description: "Extracts Package URLs and detailed manifest metadata, but relies on companion tools such as ScanCode.io for broader enrichment pipelines"
---

ScanCode Toolkit is a mature, widely used code scanning tool that detects the origin (copyrights), licenses, and dependencies of code, packages, and binaries in a codebase. It is part of the AboutCode project and is used by organizations including the Eclipse Foundation, FSF, FSFE, OpenEmbedded, and ClearlyDefined. Results can be exported as JSON, YAML, HTML, CycloneDX, or SPDX. ScanCode is general-purpose across languages and ecosystems, runs as a standalone CLI or library, and is often used as the underlying scan engine for other SBOM and compliance tools, such as OSS Review Toolkit.
