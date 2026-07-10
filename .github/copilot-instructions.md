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

`layouts/` contains all custom templates.

`assets/css/style.css` contains all custom styling. `assets/js/main.js` handles reading progress, TOC generation, and pagination.

## Frontmatter Schema

```yaml
---
title: "Tool Name"
date: '2025-01-01T00:00:00+01:00'
draft: false
developer: "Org Name"
link: "https://github.com/owner/repo"
first_release: "2017-06-01"   # ISO date; use first of month if exact day unknown
latest_release: "2025-02-01"  # ISO date from gh release view
latest_version: "vX.Y.Z"      # tag name from gh release view
functional_goals:
  creation:
    level: "full"             # "full" or "partial" only
    description: "Short explanation of why this rating applies"
  ingestion:
    level: "partial"
    description: "Short explanation of why this rating applies"
  # omit keys that have no support
security_goals:
  authenticity: "Narrative description of how the tool contributes"
  # omit keys that don't apply
---

Markdown description of the tool goes here.
```

**Valid `functional_goals` keys (all lowercase):**
`creation`, `signing`, `ingestion`, `sharing`, `signature_verification`, `quality_assessment_validation`, `conversion`, `management`, `enrichment`, `vulnerability_assessment`

**Valid `security_goals` keys (all lowercase):**
`authenticity`, `integrity`, `non_repudiation`, `confidentiality`, `authorization`, `availability`

**Capability values:** `"full"` or `"partial"` only. The `description` field explains the rating in one short sentence. The matrix table renders `level` as dot indicators (● / ◑); the detail card shows both the badge and the description.

The matrix table only displays eight lifecycle-phase columns (creation, sharing, ingestion, quality_assessment_validation, conversion, management, enrichment, vulnerability_assessment). Signing and signature_verification appear only in the detail card.

## Adding or Updating a Tool

Use the `/add-tool` skill to add a new tool from a GitHub URL. The skill contains the full step-by-step procedure.

## Hugo Configuration

`hugo.toml` sets:
- Output formats: HTML + JSON (enables `index.json` and `list.json` endpoints)
- `params.description`, `params.tagline`, `params.logo` used in templates
- `params.github` used in `partials/header.html` for the GitHub link
- Image caching under `.cacheDir/images`
