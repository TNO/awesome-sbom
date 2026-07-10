---
title: "GUAC"
date: '2025-10-28T13:48:55+01:00'
draft: false
developer: "Google, OpenSSF, OWASP"
link: "https://github.com/guacsec/guac"
first_release: "2022-06-01"
latest_release: "2026-03-13"
latest_version: "v1.1.0"
functional_goals:
  ingestion:
    level: "full"
    description: "Ingests SBOMs, SLSA provenance, Scorecard results, and other supply chain documents into a unified graph"
  management:
    level: "partial"
    description: "Stores and queries artifact relationships in a graph database; active development means some management features are still evolving"
  vulnerability_assessment:
    level: "partial"
    description: "Queries the graph for vulnerability impact across the supply chain; relies on external scanners for initial vulnerability data"
---

GUAC (Graph for Understanding Artifact Composition) is a tool designed to collect and analyze software artifacts. It builds a graph that clarifies the relationships between artifacts, making dependencies in the supply chain more transparent.
