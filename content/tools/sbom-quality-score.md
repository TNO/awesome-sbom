---
title: "SBOM Quality Score"
date: '2025-10-28T14:02:17+01:00'
draft: false
developer: "Interlynk"
link: "https://github.com/interlynk-io/sbomqs"
first_release: "2023-01-01"
latest_release: "2026-03-19"
latest_version: "v2.0.5"
functional_goals:
  ingestion:
    level: "full"
    description: "Reads CycloneDX and SPDX SBOMs to evaluate their content and completeness"
  sharing:
    level: "partial"
    description: "Can publish quality score results; primary output is a score report rather than SBOM redistribution"
  quality_assessment_validation:
    level: "full"
    description: "Scores SBOMs against the declared format specification across multiple quality dimensions and produces a detailed report"
---

SBOM Quality Score compares SBOMs against their declared format specification and assigns a quality score. This score can then be published publicly, enabling consumers to assess the quality of an SBOM before relying on it.
