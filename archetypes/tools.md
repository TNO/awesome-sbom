+++
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
date = '{{ .Date }}'
draft = true
developer = ''
link = ''
first_release = ''   # ISO date, e.g. 2023-06-01 (use first of month if exact day unknown)
latest_release = ''  # ISO date, e.g. 2025-02-01
latest_version = ''

[functional_goals]
# Each entry is an object with 'level' ("full" or "partial") and a short 'description'.
# Omit keys that do not apply.
#
# [functional_goals.creation]
# level = "full"
# description = "Generates SBOMs from ..."
#
# [functional_goals.signing]
# level = "full"
# description = "Signs SBOMs using ..."
#
# [functional_goals.ingestion]
# level = "full"
# description = "Reads ... formats for ..."
#
# [functional_goals.sharing]
# level = "full"
# description = "Exposes SBOMs via ..."
#
# [functional_goals.signature_verification]
# level = "full"
# description = "Verifies signatures using ..."
#
# [functional_goals.quality_assessment_validation]
# level = "full"
# description = "Validates SBOMs against ..."
#
# [functional_goals.conversion]
# level = "full"
# description = "Converts between ... formats"
#
# [functional_goals.management]
# level = "full"
# description = "Manages SBOMs across ..."
#
# [functional_goals.enrichment]
# level = "full"
# description = "Enriches components with data from ..."
#
# [functional_goals.vulnerability_assessment]
# level = "full"
# description = "Matches components against ..."

[security_goals]
# Plain text describing the tool's contribution — omit keys that do not apply.
# authenticity = ""
# integrity = ""
# non_repudiation = ""
# confidentiality = ""
# authorization = ""
# availability = ""
+++

<!-- Replace this with a Markdown description of the tool. -->
