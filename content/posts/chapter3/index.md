+++
date = '2025-10-27T13:15:03+01:00'
draft = false
title = '3. Producing, Managing & Sharing SBOMs'
+++

This chapter describes what an organisation needs to do in order to successfully set up the process of obtaining, managing and sharing (making available) SBOMs. Before you start with the task of producing SBOMs, a number of steps must first be completed. The various steps are briefly listed below and are further elaborated in a separate section.

{{<figure 
src="Figure3.png" 
alt="drawing"
caption="*Figure 3*"
class=figure
>}}

1. Arrange the processes for obtaining SBOMs:
    -    Reach clear agreements with the parties (internal or external) supplying the SBOMs.
    -   If relevant, organise the generation of SBOMs for
software developed in-house and open-source
software.
2. Organise a process (including the necessary tooling) for processing and managing the received SBOMs.
3. Organise the distribution of SBOMs to third parties.
4. Evaluate the previous steps and make adjustments where necessary

## step 1: Arrange
**Arrange the processes for obtaining SBOMs**

### step 1a.  Reach agreements with SBOM suppliers
Entering into dialogue with (external) software suppliers about also supplying SBOMs is an important step in working with SBOM. Even if the deployment process for SBOMs has not yet been fully arranged within your own organisation, it is still meaningful to start these conversations. By initiating the dialogue at this stage, it is possible to elaborate a phased. approach in which the agreements between the parties can be further focused on the basis of experience acquired.

If the supplier offers cloud-based software or software as a service (SaaS) this will complicate also supplying an SBOM. In that case, the software is not operated on the customer infrastructure, and because software versions for these products are generally more often subject to changes, it may prove impractical to also supply SBOMs. For that reason, the NTIA recommends that in the near future suppliers must have internal SBOMs, and that they must act on the SBOM information in a timely manner, but that SBOMs for cloud-based software and SaaS applications need not be shared. As SBOMs become more developed, the information from these SBOMs could also be included in the customer risk-management strategy.

The SBOM standards and legislation and regulations currently available offer a great deal of freedom regarding the information that must be stored in an SBOM, and the processes surrounding the exchange of SBOMs. It is therefore important to reach clear agreements with suppliers. These agreements should at least contain the following elements:
- Format of the SBOMs
- Method of supply
- Methods for guaranteeing the authenticity of SBOMs, for example via digital signatures
- Frequency of updates
- Fields/information to be completed
- Depth of the SBOM (see also the detail block: Quality of SBOMs )
- How to deal with missing information
- What are the obligations upon the supplier with regard to identified vulnerabilities

If the SBOM must be provided by an external supplier, it can be useful to not reach these agreements on a one-to-one basis because both for the supplier and the customers, this involves a great deal of work. If customers with comparable information needs join forces (for example in the form of an ISAC), a better level of harmonisation could be achieved with the SBOM suppliers and the suppliers themselves will be more easily able to satisfy the specific needs of the consumer. In such discussions, the advice is to not start from scratch but to keep pace with the standards currently under development such as the ISO/IEC 27036: Cybersecurity – Supplier relationships.

Finally, it is expected that in the future legislation and regulations will impose more specific requirements on the form and content of SBOMs. The Cyber Resilience Act for example states that the Euro- pean Commission can impose further requirements on SBOMs in the form of implementing legislation (Article 10, section 15). It is therefore important to keep monitoring these developments.

### step 1a. Organise the generation of SBOMs
Depending on how the processes within an organisation are structured, SBOMs will be generated at different moments or by different roles. The specific way in which the implementation process will be carried out will therefore largely depend on the organisation. In broad terms, the generation of an SBOM involves four stages:
- Identify the software components used
- Gather the necessary data about the software components
- Integrate the gathered information in the chosen SBOM format
- Check the resultant SBOM


In practice, stages one to three are often viewed as a single large stage. Ideally, these stages will be implemented as a fully automated process, as an integral part of the software development process. This will prevent human errors and inconsistencies. Furthermore, the generation of SBOMs during the development of software can itself contribute to the development of better and more secure products, for example byincluding information about preferred software components (for more information see the chapter on SecDevOps in [2 ]). Depending on the software build platform used, different tools are available that are capable of automatically generating an SBOM during the software build phase. No specific tools are mentioned in this guide, but on the websites of SPDX and CycloneDX lists are kept of the tools that work with the standards in question

There are a number of aspects which must be taken into account
when selecting a suitable tool:
- How does the tool tie in with the current software development process and the existing tool? Is there perhaps a tool available which can be directly integrated in the current development environment or test environment?
- On which types of file must be tool be usable; is the source code always available or must the tool for example also work on Docker images?
- How does the tool handle nested dependencies; what is the maximum step depth the tool can reach? (See also the detail block on the quality of SBOMs )

In certain cases, it is not possible to generate an SBOM during the development of the software (for example for legacy systems). In these cases, the SBOM can be produced post-build. A post-build SBOM can be generated on the basis of SBOMs for sub-components or on the basis of scans of the software using code analysis tools. Additional manual work will often still have to be carried out, for example to retrieve information from licence agreements. Two important points for attention when generating SBOMs are the inclusion of runtime dependencies and container information. Today, much software is created with the assistance of containers like Docker. To prevent the generation of false negatives during the automated matching of information with the components of an SBOM, the SBOM itself must also contain information about these runtime dependencies and all containers. For stage 4, checking the generated SBOM, it is possible to check whether the layout of the SBOM conforms with the requirements from the standard. Tools are available for this purpose for the various standards (see also the websites of SPDX and CycloneDX). To verify the content of the SBOM (a task for the supplier or the consumer), use can be made of frameworks that evaluate the maturity of the SBOM generation process and are consequentlyable to allocate a specific degree of reliability to the resultant SBOM [6 ]. Two examples are: the OWASP Software Component Verification Standard (SCVS) and ISO 5230. 

---

## Step 2: Organise the Process
**Organise the processing and managment of SBOMs**

To be able to make use of SBOMs within the organisation, it is important that the relevant information from all SBOMs be made available in a uniform manner. Ideally, this information will be read out and stored automatically in a central database. For an ever growing number of applications, tools will become available for reading SBOMs directly into a standard format (CyclonDX, SPDX) However, this will not immediately be possible for all SBOMs and additional processing stages will have to be organised.

Two example are:
- Due to the challenges relating to the unique identification of components (see the detail block: Unique identification of software ) it can be necessary in certain cases to determine the identity of components (entity resolution). There are support tools for this purpose too but it can be a complex process that also requires manual work.
- Depending on the depth of the SBOM, it may be necessary to search for dependencies on dependencies (transitive dependency resolution). The number of dependencies that have to be worked through can grow rapidly, so the use of tools for this task is recommended.

The management of SBOMs within the organisation involves two aspects: on the one hand ensuring that the SBOMs are up to date and on the other managing the total collection of SBOMs. Both aspects are briefly explained below.

Throughout their lifecycle, software applications often undergo changes, such as bug fixes, security patches, new features, etc. Every time the software is altered, the software supplier must also supply a new SBOM that includes the changes. In theory, the software configuration carried out by the software customer can also be added to the SBOM. In this way, it is possible to distinguish between different configurations which may also have different runtime dependencies. In practice, however, as yet little is known about how this can be used. The advice is not to set up a separate process for managing the SBOMs over time, but to link this process to already existing processes for software configuration management.

To manage the total overview of SBOMs, the same aspects are relevant as those that apply to the management of other large volumes of data: storage capacity, indexing, backup systems, etc. A specific point for attention for SBOM storage is security. It is after all essential that the organisation can trust the SBOMs, and for that reason the risk of SBOM sabotage by malicious parties must be minimised.


---

## Step 3: Organise the distribution
**Organise the distribution of SBOMs to third parties**

SBOMs can be distributed to other organisations in a number of different ways. A number of examples:
- The SBOM is downloaded via the website/API of the supplier the address appears in a pre-agreed location in the software.
- The SBOM is sent by email or other communication channel.
- The SBOM is supplied as part of the software package or the embedded system

When making choices about the structure of the distribution
process, the following factors must be taken into account:
- Offline availability: for embedded systems, among others, it can be important to have an option for inspecting the SBOM on the system, at all times, even without online integration. In this situation, the SBOM must be an integral part of the software package.
- Possibility of automation: a major benefit of SBOM is the possibility of automation of a number of processes. To be able to benefit from this advantage, the distribution/reception of SBOMs will also have to be automated. This argues in favour of solutions such as APIs, rather than email or other information communication channels.
- Scalability: this point is an extension of the previous two points. The expectations is that the number of SBOMs managed by an organisation will quickly grow considerably, for example because of different customers, different versions, etc. This could be a reason to consider setting up an API with push/subscribe options, in which SBOMs are automatically shared.

At present, there are still few best practices relating to the sharing of SBOMs. The CISA has organised an SBOM Workstream relating to SBOM ‘Sharing & Exchanging’ in which they are working to develop recommendations, together with the community.

---

## Step 4: Evaluate
**Evaluate and improve**

The use of the SBOM and the accompanying tooling is still a relatively new phenomenon, and will undergo numerous developments over the coming period. It is therefore advisable to follow a phased approach starting with the low-hanging fruit and which leaves space for incorporating new best practices or tooling. To make this possible, use could be made of a continuous improvement approach such as the [Plan-Do-Check-Act cycle](https://www.sixsigma.nl/wat-is-de-pdca-cyclus). In this process, it is important to identify concrete/ measurable targets in the plan phase, and to reach clear agreements for the do phase. The advice is to start small and to gradually discover which processes operate smoothly and where further information or connections are missing. In the check phase, also involve the relevant parties from outside your own organisation, such as software suppliers and peer organisations. This makes it possible to reach joint decisions on alternative approaches where necessary, and the relevant processes and toolchains will be established in an iterative process.



## Detail section

{{< details summary="The quality of SBOMs" >}}
Because no consensus has yet been reached about exactly what must be recorded in an SBOM, there is also no standardised approach to evaluating the quality of an SBOM. Best practice is to have SBOMs generated automatically during the build process as far as possible. In this way, human errors (for example in the processing of naming and updating) are avoided, as far as possible. Due to the wide variety of tools and configuration options, even in this situation, it is not self-evident that and automatically generated SBOM wwill compmly with (implicityly) expected quality requirement. In addition to the continious ever present challenges relating to the unique identifaction of components, there are two other important points for attention in evaluation the quality of an SBOM:

- Depth
- Completeness

The **depth** of an SBOM refers to the number of stages in which dependencies on dependencies (i.e. transitive dependencies) are included. The minimum requirements presented by the American government state that an SBOM must at least describe the primary components with all direct dpendencies, in other words, 1 step. These components and dependencies must dbe described in sufficient detail to be able to iteratively identify the transitive dependencies. For many SBOM applications, it is essential to establish the most complete possible overview of the software supply chain such that the number of steps should be as high as possible. A good example of the importance of >1 step is described in "Roles and Benefits for SBOM Across the Supply Chain" (8 November 2019). At present, it can prove difficult for software supplier to create deep SBOMs, due to existing requirements imposed by sub-component suppliers. The expectation is that as more organisations start to work with SBOMs, it will become possible to add more detail. At that point, the depth could also become a quality requirement recorded in the agreements between the software supplier and the consumer.

When analysing the completeness of an SBOM, it is particularly important to be able to distinguish between components that have no dependencies and components of which in the dependencies are unknown (i.e. known unknonws). Determining the completeness of an SBOM is not a trivial task. To be able to evaluate a generated SBOM, knowledge must be. available about the software for which the SBOM was generated. This may sound paradoxical, but it does mean that SBOM suppliers must have a thorough understanding of their configuration management if they are to be able to validate an SBOM. For organisations that consume SBOMs, certainly in the early stages of using SBOMs, this evaluation process will be even more difficult. In other words, at present it is difficult to evaluate the quality of SBOMs. It is therefore important both for SBOM suppliers and SBOM consumers that a process be equipped that makes it possible to identify non-conformaties and shortcomings, and hence to subsequently imporve the quality of SBOMs. Certainly during the early phases of use of SBOMs, this is expected to be a manual and knowledge-intensive process.


{{< /details >}}

{{< details summary="Unique identification for software" >}}
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

