+++
date = '2025-10-28T12:03:40+01:00'
draft = false
title = 'CycloneDX CLI'
manufacturer = "OWASP"
link = "https://github.com/CycloneDX/cyclonedx-cli"
+++

## Tool Maker

**OWASP**

---

## Description

A CLI tool to perform various operations on SBOMs. Compared to `sbom-utility`, it can create and verify signatures, but it does not have the capabilities to query SBOMs for vulnerabilities or components.

---

## First Release – Latest Release (version)

**October 2022 – November 2024 (v0.27.2)**

---

## Link

https://github.com/CycloneDX/cyclonedx-cli

---

## Security Goals

| Goal              | Contribution                                                  |
|-------------------|---------------------------------------------------------------|
| Authenticity      | Can create and verify signatures for SBOMs                    |
| Integrity         | Can create and verify signatures for SBOMs                    |
| Non-repudiation   |                                                               |
| Confidentiality   |                                                               |
| Authorization     |                                                               |
| Availability      |                                                               |

---

## Functional Goals

| Function                        | Contribution |
|---------------------------------|--------------|
| Creation                        | ✅            |
| Signing                         | ✅            |
| Ingestion                       | ✅            |
| Sharing                         |              |
| Signature verification          | ✅            |
| Quality assessment & validation | ✅            |
| Conversion                      | ✅            |
| Management                      |              |
| Enrichment                      |              |
| Vulnerability Measurement       |              |