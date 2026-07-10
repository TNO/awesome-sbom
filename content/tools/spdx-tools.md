---
title: "SPDX Tools (Java/Python)"
date: '2025-10-28T13:48:51+01:00'
draft: false
developer: "SPDX"
link: "https://github.com/spdx/tools-python"
first_release: "2012-01-01"
latest_release: "2026-03-13"
latest_version: "v0.8.5"
functional_goals:
  creation:
    level: "full"
    description: "Creates SPDX-format SBOMs programmatically via Python and Java library APIs"
  ingestion:
    level: "full"
    description: "Reads SPDX SBOMs in all standard serialisation formats (tag-value, JSON, RDF, YAML)"
  quality_assessment_validation:
    level: "full"
    description: "Validates SPDX SBOMs against the SPDX specification for schema conformance and required fields"
  conversion:
    level: "partial"
    description: "Converts between SPDX serialisation variants (tag-value, JSON, RDF, YAML); does not convert to or from CycloneDX"
---

The two SPDX libraries for Java and Python offer the most functionalities for working with SPDX-format SBOMs, including creation and validation. It is important to note that they do **not** support conversion between CycloneDX and SPDX — conversion is limited to SPDX format variants.
