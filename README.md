# Awesome SBOM

> One stop shop for SBOM tooling information

A curated, structured catalog of [Software Bill of Materials (SBOM)](https://en.wikipedia.org/wiki/Software_supply_chain) tools — published as a static site at **[tno.github.io/awesome-sbom](https://tno.github.io/awesome-sbom/)**.

Each tool is described by its functional goals (creation, ingestion, signing, vulnerability assessment, …) and security goals (authenticity, integrity, non-repudiation, …), rendered as a searchable comparison matrix plus detailed cards.

## Stack

| Layer | Technology |
|---|---|
| Static site generator | [Hugo](https://gohugo.io/) (extended, managed via `mise`) |
| Content | Markdown + TOML frontmatter in `content/tools/` |
| Styling | Plain CSS in `assets/css/style.css` |
| Scripting | Vanilla JS in `assets/js/main.js` |
| CI/CD | GitHub Actions → GitHub Pages |

## Development

### Prerequisites

Install [mise](https://mise.jdx.dev/) and let it install Hugo:

```bash
mise install
```

### Local server

```bash
hugo server
```

The site is served at `http://localhost:1313/awesome-sbom/` with live reload.

### Adding a tool

1. Create a new content file from the archetype:
   ```bash
   hugo new tools/my-tool-name.md
   ```

2. Open the generated file and fill in the frontmatter — `title`, `developer`, `link`, release info, and capability ratings.

3. Replace the placeholder body with a short Markdown description of the tool.

4. Set `draft: false` when it's ready to publish.

The [Copilot `add-tool` skill](https://github.com/TNO/awesome-sbom) can automate most of this from a GitHub URL if you're using the Copilot CLI.

### Frontmatter reference

```toml
title       = "Tool Name"
developer   = "Org or maintainer"
link        = "https://github.com/owner/repo"
first_release  = "2020-01-01"   # ISO date (first of month if exact day unknown)
latest_release = "2025-06-01"
latest_version = "v1.2.3"

[functional_goals]
# level = "full" | "partial"; description is one short sentence
[functional_goals.creation]
level       = "full"
description = "Generates CycloneDX and SPDX SBOMs from source and containers."

[security_goals]
authenticity = "Signs SBOMs with Sigstore/cosign."
```

**Functional goal keys:** `creation`, `signing`, `ingestion`, `sharing`, `signature_verification`, `quality_assessment_validation`, `conversion`, `management`, `enrichment`, `vulnerability_assessment`

**Security goal keys:** `authenticity`, `integrity`, `non_repudiation`, `confidentiality`, `authorization`, `availability`

### Deployment

Merging to `main` triggers the GitHub Actions workflow which builds with `hugo --gc --minify` and deploys to GitHub Pages automatically.

## Contributing

Contributions are very welcome! The most useful things you can do:

- **Add a missing tool** — open a PR with a new file in `content/tools/`.
- **Update stale data** — `latest_version` / `latest_release` go out of date quickly.
- **Improve capability ratings** — if a tool's rating seems wrong, explain why in the PR description.
- **Fix the site itself** — templates live in `layouts/`, styles in `assets/css/`.

Please keep descriptions factual and brief, and base capability ratings on documented features rather than marketing copy.

## License

[Apache 2.0](LICENSE) — © TNO
