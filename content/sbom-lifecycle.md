# SBOM Lifecycle Phases: Functional and Security Requirements

## Phase 1 — Produce
This phase covers the process of generating an SBOM for a specific software artifact. This can be done manually or, preferably, as part of an integrated software development process. The SBOM should detail all components, direct and indirect dependencies, and relevant metadata. The quality and completeness of the SBOM are foundational for the rest of the lifecycle.

### Functional Goals
| Functional Goal | Description |
|---|---|
| Creation | Generating an SBOM for a specific software artifact. |

### Security Goals
| Security Goal | Description |
|---|---|
| Authenticity | Ensure that the information used to create the SBOM comes from a trusted source. |
| Integrity | All data involved in the production process must be included in the SBOM without alteration. |
| Non-repudiation | The origin of the SBOM can be reliably recorded, and the recipient has proof of the source's identity. |
| Confidentiality | An attacker cannot read the SBOM; it is encrypted or only accessible to authorized parties. |
| Authorization | An SBOM may only be edited by processes or users with the appropriate authorization. |

---

## Phase 2 — Share
After creation, the SBOM is shared between producer and consumer (or third parties). Secure and reliable exchange is essential, whether the SBOM is made public or shared privately. The process must ensure authenticity, integrity, and confidentiality.

### Functional Goals
| Functional Goal | Description |
|---|---|
| Sharing | Facilitate sharing from a supplier to a consumer, or from a consumer to a third party. |
| Ingestion | Import SBOMs from suppliers and/or third parties. |

### Security Goals
| Security Goal | Description |
|---|---|
| Authenticity | Verify the identity of sender and receiver, as well as the correctness of the SBOM. |
| Integrity | An SBOM must arrive at the recipient without modification. |
| Non-repudiation | The generation or sharing of an SBOM is recorded and cannot later be denied by the supplier. |
| Confidentiality | Only authorized parties may view an SBOM. |
| Authorization | Only an authorized party should be able to share and receive an SBOM. |

---

## Phase 3 — Manage
This phase involves storing and maintaining SBOMs within the organization. It includes updating SBOMs when software changes, validating quality, converting formats, and enriching SBOMs with new vulnerability or security information.

### Functional Goals
| Functional Goal | Description |
|---|---|
| Quality assessment & validation | Check structural correctness and completeness of the SBOM against SBOM standards and internal requirements. |
| Conversion | Convert SBOM information into formats (often CycloneDX and SPDX) supported by organizational tools and processes. |
| Management | Manage the SBOM collection: ensure availability, integrity, and confidentiality; verify validity; archive SBOMs no longer relevant. |
| Enrichment | Enrich SBOMs with new vulnerability information and security advisories (e.g., VEX and CSAF), and add dependency/quality info from other sources. |

### Security Goals
| Security Goal | Description |
|---|---|
| Confidentiality | The SBOM storage within an organization must only be accessible to authorized users. |
| Integrity | During SBOM management, it must remain accurate and complete; updates in the software product must be reflected in the SBOM; old SBOMs should be archived. |
| Availability | SBOM storage must always be available for use. |
| Authorization | SBOMs should only be managed by an entity with the appropriate authorization. |

---

## Phase 4 — Deploy
In this phase, the SBOM is actively used for risk management, vulnerability management, and compliance processes. The SBOM is linked to vulnerability information to assess and mitigate risks in the software supply chain.

### Functional Goals
| Functional Goal | Description |
|---|---|
| Vulnerability assessment | Use SBOM and vulnerability information for security operations and risk management. |

### Security Goals
| Security Goal | Description |
|---|---|
| Confidentiality | SBOM and vulnerability information should not be visible to unauthorized individuals. |
| Integrity | Ensure that the deployed SBOM is correct and complete. |
| Availability | An organization must always have access to the SBOM collection to quickly link vulnerabilities. |
| Authorization | Only authorized individuals may make changes or add information to the systems. |