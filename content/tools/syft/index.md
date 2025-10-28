+++
date = '2025-10-28T14:09:00+01:00'
draft = true
title = 'Syft'
manufacturer = "Anchore"
link = "https://github.com/anchore/syft"
+++

## Tool Maker

**Anchore**

---

## Description

A CLI tool for generating SBOMs for containers and other systems.

---

## First Release – Latest Release (version)

**May 2020 – January 2025 (v1.19.0)**

---

## Link

https://github.com/anchore/syft

---

## Security Goals

| Goal              | Contribution                                                  |
|-------------------|---------------------------------------------------------------|
| Authenticity      | Can create and verify signatures for SBOMs                    |
| Integrity         | Can create and verify signatures for SBOMs                    |
| Non-repudiation   | Can create and verify attestations for SBOMs                  |
| Confidentiality   |                                                               |
| Authorization     |                                                               |
| Availability      |                                                               |

---

## Functional Goals

| Function                        | Contribution       |
|---------------------------------|--------------------|
| Creation                        | ✅                  |
| Signing                         | ✅                  |
| Ingestion                       | ✅                  |
| Sharing                         |                    |
| Signature verification          | ✅                  |
| Quality assessment & validation |                    |
| Conversion                      | ✅                  |
| Management                      |                    |
| Enrichment                      |                    |
| Vulnerability Measurement       | ☑️ (with grype)     |
