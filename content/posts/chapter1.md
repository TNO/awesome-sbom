+++
date = '2025-10-22T16:46:10+02:00'
draft = false
title = '1. What is an SBOM'
+++

An SBOM describes the components that make up a piece of software and the relationships between those components. It is a nested list of software components comparable to the list of ingredients on food products. One vital aspect of this list is that the structure is **formalised (i.e., machine-readable)**, thereby opening the way for automation. *Figure 1* is an example of a simple SBOM.

{{<figure 
src="images/Figure1.png" 
alt="drawing"
caption="*Figure 1*"
class=figure
>}}

The concept of a component list is neither new nor specific to software. Alongside the SBOM, in certain sectors a **Hardware Bill of Materials (HBOM)** or **Component Bill of Materials (CBOM)** are also used. These two can play a role in the framework of vulnerability management and supply chain security, but are beyond the scope of this starter guide.

This chapter starts by providing an overview of the information that should be recorded in an SBOM, before considering which standards are currently available.

---
## What is an SBOM

At the time of writing, there is no unequivocal description of exactly what an SBOM should look like, and which elements an SBOM must contain. There are different standards, each with their own structure and mandatory fields. The various standardisation and regulation initiatives have also only revealed a limited number of requirements.

The update to the **ISO/IEC 27036-3** standard currently being developed describes a set of essential elements that should appear in an SBOM. This set is more detailed than the minimum set of requirements specified by the American government but does contain a number of elements which increase the possibility for effectively deploying SBOMs.

### Essential Elements:
- **Author**: The person/organisation that generated the SBOM
- **Timestamp**: For the production or revision of the SBOM
- **Life cycle**: Where in the software development process the SBOM was generated (pre-build, build, post-build)
- **For each component**:
  - Supplier name
  - Component name
  - Version
  - Cryptographic hash
  - Unique identifier
  - Relationships between components
  - Source (e.g., GitHub or a specific package manager)

The **unique identifier** element is of real importance in the (automated) use of SBOMs, but here too there is no uniform standard available as yet.
The detail block at the bottom of this page describes this problem more precisely. In practice, this means that when reaching agreements on the content of an SBOM, specific attention must also be paid to how the unique identifier element will be implemented.

---

## SBOM Standards

At the time of writing this guide, there are two widely used SBOM standards:
- **CycloneDX**: A lightweight open-source standard managed by the CycloneDX working group (roots in OWASP)
- **SPDX**: An ISO-certified open-source standard (ISO/IEC 5962:2021) managed by the Linux Foundation Project

As yet, there is no consensus within the SBOM community onwhich standard can best be chosen. In practice, the standards are interoperable because there is sufficient overlap between the different fields and the essential elements can be described in all standards [5 ]. 
The best practice is to support both SPDX and CyclonDX. There are tools that can handle both formats and tools that can convert one format into the other. This may result in the loss of additional information, so it is important to investigate in advance which information is important for your own organisation.


---
## Detail section

{{< details summary="unique identification for software" >}}
To enable the effective use of SBOMs, it is essential that software components be identified in the same way everywhere. Only then can a software component from an SBOM be automatically linked to known vulnerabilities, licences, and other relevant information.
Common identification methods:
- Coordinates (group, name, version)
- **Package URL (PURL)**
- **Common Platform Enumeration (CPE)**
- **Software Identification (SWID) tagging**
- Cryptographic hash functions (SHA-1, SHA-2, SHA-3, BLAKE2b, BLAKE3)

The use of coordinates is described as: group, name and version. 
An example is "group": "org.example", "name": "sample-library", 
"version": "1.0.0.

**PURL** was the result of an initiative to introduce a standard method of identifying software packages, independently of the context of a specific package manager. It makes use of a simple syntax in which a number of components are combined to form a URL: scheme:type/namespace/name@version?qualifiers#subpath. This results in identifiers such as: pkg:maven/orga.apache.xmalgrahpics/batik-anim@1.9.1?packaging=sources.

**CPE** is a commonly used standard, in particular in combination with vulnerability and incident management. However the, process surrouding the setting of a CPE is unfortunately vulnerable to human error. In addition, the granularity of the CPE approach is too limited in certain situations to determine whether a software component actually contains a vulnerability. For that reason, the SBOM Forum recommends switching to the use of PURL.

The **Software Idenfification (SWID)** Tag is an ISO-standard which was already defined in 2012 as a means of maintaining an overview of the software installed within an organisation. In practice, in the context of SBOM, SWID Tags are primarily used as a meas of identifying software components within the CyclonDX or SPDX format, which is explained in the section on SBOM Standards.

the use of **Hashes** is a well-known means of verifying that two pieces of code are identical. In practice, this proves difficult to use because different hash functions are used or because it is unclear precisely which components of a package have been included in the hash. For example, is or is not the SBOM itself part of the hash if delivered as part of the package?

in addition ot the use of different standards, the names used by suppliers for software are also subject to changes, for example as a result of merges and acquisitions between the organisations, or as a result of new project forks.

The conclusion is that there is still a long way to go before a uniform global approach will be introduced for identifying software components. Until that time, the NTIA recommends applying the following principles
- If a uniform method already exists for identifying a component, follow this method. examples are names from suppliers that allocate clear identifiers to their software.
- If no uniform method yet exists, choose an existing, commonly used standard to describe a component.


{{< /details >}}

---