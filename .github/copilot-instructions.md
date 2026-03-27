# Copilot Instructions

This is a Hugo static site that catalogs SBOM (Software Bill of Materials) tools and lifecycle documentation, deployed to GitHub Pages at `https://tno.github.io/awesome-sbom/`.

## Build Commands

```bash
# Local development server
hugo server

# Production build (matches CI)
hugo --gc --minify --baseURL "https://tno.github.io/awesome-sbom/"

# Create a new tool page from the archetype
hugo new tools/my-tool-name.md
```

No test or lint commands exist in this project.

## Architecture

The site is **content-driven**: each SBOM tool is a Markdown file in `content/tools/` with structured frontmatter and a Markdown body. The homepage composes three partials:

1. `partials/tools-intro.html` — intro text from `data/tools-intro.yaml`
2. `partials/matrix-table.html` — capability comparison matrix, reads all pages in `Section = "tools"`
3. `partials/tools-detail.html` — full tool cards, iterates sorted tool pages and calls `tools-detail-card.html` per tool

`layouts/` contains all templates.

`assets/css/style.css` contains all custom styling (3500+ lines). `assets/js/main.js` handles reading progress, TOC generation, and pagination.

## Adding or Updating a Tool

Each tool is a file in `content/tools/<slug>.md`. Run `hugo new tools/<slug>.md` to generate from the archetype (`archetypes/tools.md`).

Frontmatter schema:

```yaml
---
title: "Tool Name"
date: '2025-01-01T00:00:00+01:00'
draft: false
developer: "Org Name"                  # single field, replaces old manufacturer/tool_maker
link: "https://example.com"
first_release: "2017-06-01"   # ISO date; use first of month if exact day unknown
latest_release: "2025-02-01"  # ISO date
latest_version: "vX.Y.Z"
functional_goals:
  Creation: "full"        # "full" = fully supported
  Signing: "partial"      # "partial" = partially supported
  Ingestion: "full"       # omit keys entirely when not supported
security_goals:
  Authenticity: "Narrative description of how the tool contributes"
  # omit keys that don't apply
---

Markdown description of the tool goes here.
```

**Capability values:** use `"full"` or `"partial"` only — omit keys that have no support. The templates render these as styled pill badges in detail cards and dot indicators (● / ◑) in the matrix. Never use emoji.

**Valid `functional_goals` keys:** `Creation`, `Signing`, `Ingestion`, `Sharing`, `Signature_verification`, `Quality_assessment_validation`, `Conversion`, `Management`, `Enrichment`, `Vulnerability_assessment`

**Valid `security_goals` keys:** `Authenticity`, `Integrity`, `Non-repudiation`, `Confidentiality`, `Authorization`, `Availability`

The matrix table only displays the eight lifecycle-phase columns (Creation, Sharing, Ingestion, Quality_assessment_validation, Conversion, Management, Enrichment, Vulnerability_assessment). Signing and Signature_verification appear only in the detail card.

## Hugo Configuration

`hugo.toml` sets:
- Output formats: HTML + JSON (enables `index.json` and `list.json` endpoints)
- `params.author`, `params.tagline`, `params.logo` used in `partials/header.html`
- Image caching under `.cacheDir/images`
