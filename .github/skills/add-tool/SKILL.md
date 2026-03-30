---
name: add-tool
description: Add a new SBOM tool page to the awesome-sbom site. Use this skill when asked to add a tool, given a GitHub repository URL.
---

Follow these steps to add a new tool to the site.

## 1. Get release info

Use the `gh` CLI to fetch the latest release tag and publish date in one call:

```bash
gh release view -R owner/repo --json tagName,publishedAt \
  --jq '.tagName + "\t" + .publishedAt[:10]'
```

Use the tag name as `latest_version` and the date (YYYY-MM-DD) as `latest_release`.

## 2. Read the README

Fetch the README to understand what the tool does and what features it supports:

```
web_fetch https://raw.githubusercontent.com/owner/repo/main/README.md
```

Try `master` if `main` returns a 404.

## 3. Create the file

Derive the slug from the repo name (lowercase, hyphens). Create the file directly at `content/tools/<slug>.md` — do not use `hugo new` as it sets `draft: true`.

## 4. Write the frontmatter

Use this schema exactly:

```yaml
---
title: "Tool Name"
date: '2026-01-01T00:00:00+01:00'
draft: false
developer: "Org Name"
link: "https://github.com/owner/repo"
first_release: "2021-05-01"   # ISO date; use first of month if exact day unknown
latest_release: "2025-11-03"  # from gh release view
latest_version: "v1.2.3"      # from gh release view
functional_goals:
  creation:
    level: "full"
    description: "One sentence explaining why this rating applies"
  ingestion:
    level: "partial"
    description: "One sentence explaining the limitation"
security_goals:
  authenticity: "Narrative description of how the tool contributes"
---
```

**Valid `functional_goals` keys** (all lowercase, omit those that do not apply):
`creation`, `signing`, `ingestion`, `sharing`, `signature_verification`, `quality_assessment_validation`, `conversion`, `management`, `enrichment`, `vulnerability_assessment`

**Valid `security_goals` keys** (all lowercase, omit those that do not apply):
`authenticity`, `integrity`, `non_repudiation`, `confidentiality`, `authorization`, `availability`

**Capability levels:**
- `"full"` — the feature is a primary, first-class capability of the tool
- `"partial"` — the feature is secondary, limited in scope, or requires a companion tool

## 5. Map README features to functional goals

Use this mapping as a guide:

| Goal | Ask yourself |
|---|---|
| `creation` | Does it generate SBOMs from source code, images, or package manifests? |
| `signing` | Does it sign SBOMs or artifacts? |
| `ingestion` | Does it read/consume SBOMs as input? |
| `sharing` | Does it serve or distribute SBOMs to consumers via API or registry? |
| `signature_verification` | Does it verify signatures on SBOMs or artifacts? |
| `quality_assessment_validation` | Does it validate or score SBOM quality/completeness? |
| `conversion` | Does it convert between SBOM formats (CycloneDX, SPDX, etc.)? |
| `management` | Does it manage SBOMs across a portfolio or lifecycle? |
| `enrichment` | Does it enrich components with external data (vulnerability feeds, metadata)? |
| `vulnerability_assessment` | Does it assess components against known vulnerability databases? |

For each included goal, write a one-sentence `description` explaining *specifically* why the tool receives that rating.

## 6. Map security goals

Include security goals only where clearly supported by the tool:
- `authenticity` / `integrity` / `non_repudiation`: signing and attestation features
- `authorization`: authentication, RBAC, OIDC/LDAP support
- `availability`: storage APIs, CDN, redundancy features
- `confidentiality`: encryption or access control for sensitive data

## 7. Write the Markdown body

Write 3–6 sentences describing: what the tool is, its primary use case, and any notable integrations or limitations. Place this after the closing `---` of the frontmatter.

## 8. Verify the build

```bash
hugo --gc --minify --baseURL "https://tno.github.io/awesome-sbom/"
```

The build must pass with no errors before the task is complete.
