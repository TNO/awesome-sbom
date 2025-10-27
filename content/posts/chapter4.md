+++
date = '2025-10-27T14:56:43+01:00'
draft = false
title = '4. Deploying SBOMs'
+++

This chapter describes how SBOMs can be deployed to reinforce the vulnerability management process. To make optimum use ofthe benefits of SBOM, it is heavily recommended to also immediately integrate the use of the Vulnerability Exploitability eXchange (VEX) security advisory.For that reason, this chapter also describes how the combination of SBOM and VEX can be employed to ensure a more effective vulnerability management process. In this guide, vulnerability management is defined as a continuous, proactive and risk-driven process used by organisations to secure their systems against cyber threats. In this process, potential vulnerabilities are identified and interpreted, at which point prioritised vulnerabilities are tackled on the basis of a risk assessment. Because it is a continuous process, it is often also referred to as the vulnerability management cycle. The precise way in which this cycle is structured will differ from organisation to organisation, but in broad terms, three steps can be identified:
• Know which assets the organisation owns and when vulnerabilities in respect of those assets are discovered.
• Create an insight into the impact of vulnerabilities and which mitigating measures need to be implemented.
• Implement the chosen mitigating measures.

The idea behind using SBOM for vulnerability management is that SBOMs can accelerate the process of searching for vulnerable software components and their dependencies. This is because SBOMs provide an overview of which software components are used and where they are located. As a consequence, security specialists can use their already scarce time to focus on prioritising and mitigating the vulnerabilities. One point that does deserve attention in this connection is that a better total overview of all software components combined with an ever growing number of known vulnerabilities will result in the identification of more and more potential vulnerabilities in step 1 of the vulnerability management cycle. The ability to rapidly estimate which vulnerabilities deserve further investigation will itself become increasingly important as a consequence. VEX is expected to play an important role in this process. The following sections first provide an explanation of what VEX is, before considering how SBOM and VEX can be used together in the vulnerability management process.

## What is VEX
VEX is a type of security advisory according to which software suppliers can indicate the actual impact they expect a specific vulnerability to have on a product [11 ]. A VEX document is machine-readable and contains at least the following information:
- The metadata, to identify the document and the author.
- The product details, such as the identifier and the software version number.
- Details about the vulnerability, including an identifier and an explanation.
- The VEX status for the product.


The VEX status is the field which indicates whether the software is vulnerable. The supplier can choose from the following options:
- not affected,
- affected,
- fixed, or
- under investigation.


The next section describes how to deal with the various options.

As well as warning consumers about serious vulnerabilities, VEX statuses can in fact also be used to reassure consumers that certain vulnerabilities do not apply to them. Sometimes a software application does contain a vulnerability component but nevertheless does not represent a risk because the vulnerability is compensated for in some other way or because the affected piece of code is not called up. A supplier is able to make this analysis and subsequently inform its entire customer base.


## Integrating SBOM and VEX in the vulnerability management Cycle
Having explained all the building blocks, this section describes how SBOM and VEX can be combined in the vulnerability management process. The description refers back to the steps of the vulnerability management cycle described above.

### Step 1: Know which assets the organisation owns and when vulnerabilities against those assets are discovered.
By setting up the production and management of SBOMs as described in the previous chapter, the organisation has access to a continuous, up-to-date overview of the software components used. As soon as a new vulnerability is made known, it can be entered into a vulnerability management tool at which point the tool automatically indicates which software packages contain the vulnerable component. Depending on the tooling chosen, different options will be made available for linking vulnerabilities to software components from an SBOM. A number of options:

- The tool has a direct link to a vulnerability database such as the NIST National Vulnerability Database or MITREs Common Vulnerabilities and Exposures database. As soon as a new vulnerability is added, the tool scans the SBOM database to determine which components are vulnerable.
- The organisation receives information about a new vulnerability via a non machine-readable format such as an email, website or telephone call. A security analyst then manually enters this information in the tool, at which point the toolscans the SBOM database for vulnerable components.
- The organisation receives information about a new vulnerability via a machine-readable format such as a VEX document. These documents can be directly entered by the tool. Work is currently underway on a standard that makes this possible: the Common Security Advisory Framework (CSAF). For more information see the detail section at the bottom of the page

In particular at this stage, the SBOM will save a great deal of time.As soon as the information about a vulnerability has been loaded into the vulnerability management tool, the security analyst will be able to see within just a few seconds in which application within the organisation the vulnerability is present. Remember that there will always be software components within an organisation that are not or not fully covered by an SBOM (open-source software without SBOM, for example). For software components, this means that a risk assessment must be carried out in advance of the extent to which they are sufficiently covered by SBOM data. It is also important at that moment to determine how to deal with critical vulnerabilities that could apply to the component (can the application in which the component is used be temporarily shut down, while determining whether the component is vulnerable).

### Step 2: Create an insight into the impact of vulnerabilities and which mitigating measures need to be implemented.
At this stage, the added value of VEX becomes clear. After step 1 has been implemented, the analyst will be faced with a list of a possibly large number of potentially vulnerable applications. That is why it is so important to reach clear agreements in advance with software suppliers about the supply of VEX documents. Ideally, in the event of serious vulnerabilities, the supplier will automatically send a VEX document to its customers. According to alternative agreements, the organisation can ask the supplier for a VEX status relating to a specific vulnerability. As soon as the VEX is received, it can be automatically read by the vulnerability management. The status allocated in the document determines the next step:

- Not affected: the vulnerability has no impact on the product and no further action is required.
- Fixed: this status is often issued in combination with an affected status. It can for example mean that the current product version is not influenced but previous versions are. In principle, this status means that no action is currently required. However, if the previous (vulnerable) version was also used by the organisation, and the vulnerability relates to a critical system, it may still be essential to carry out a more in-depth investigation to be certain that malicious parties have not already made use of the vulnerability while the old version was still in use.
- Under investigation: this status is issued until the supplier has sufficient information to update the status. The agreements with the supplier must also include an agreement on how to deal with this status. It is recommended that you agree that the customer will not seek to contact the supplier, to allow the supplier to carry out the investigation, rather than having to respond to concerned customers.
- Affected: the product is vulnerable to the new threat. In these cases, the supplier must specify which steps the customer needs to take in order to minimise the risk of the vulnerability, for example updating the product to a safe version. The customer must then implement the mitigating measures via its own vulnerability management process (this then is step 3)

If no VEX status is supplied, it will be up to the analyst to carry out the risk assessment to determine whether a software package with a vulnerable component is actually vulnerable.

As soon as it becomes clear whether a software product is or has been vulnerable, the security analyst must determine the actual impact of a vulnerable software product for the organisation, which mitigating measures are possible for the organisation, and their potential impact on the organisation. The way in which these considerations should be made is the same as how this process should be carried out without SBOM and VEX, and as such is beyond the scope of this guide. Specifically for vulnerabilities in commonly used components (such as with the Log4J incident), SBOM is able to offer a greater insight into the total picture of the full range of software products that are influenced, thereby making it possible to arrive at a more balanced consideration of the total package of mitigating measures and their impact.

### Step 3: Implement the chosen mitigating measures.
In this step, the chosen mitigating measures are actually implemented. This often involves a preparation and a test phase, as well as a rollout phase, after which a check must be carried out to determine whether the measures have indeed had the desired effect. The actual implementation of this step is not directly influenced by the use of SBOM and VEX.

If the underlying processes and tooling are well matched, the combined deployment of VEX and SBOM can help automate atime-consuming element of the vulnerability management process. This matching or harmonisation process is no trivial task and many aspects relating to interoperability and standardisation still need to be further elaborated. A determination will have to be made for each individual organisation about how the processes are set up and which combination of support tools best suits them. Nevertheless, all relevant parties strongly recommend making a start on the use of SBOM for vulnerability management. This tool requires a phased approach, with space for evaluation and adjustments.

---

## Detail section
{{< details summary="CSAF" >}}
At present, information about vulnerabilities is shared in many different ways. For example via mailing lists or blogpost, or in
urgent cases via a telephone call from a supplier or the NCSC. The Common Security Advisory Framework (CSAF) has been
developed to standardise the form of security advisories and to make them machine-readable. This makes it possible to distribute
information about new vulnerabilities more rapidly, and to process that information automatically [20 ]. CSAF is managed by the
standardisation group OASIS Open and is actively promoted by NTIA (US) and BSI (DE). CSAF is the replacement for the Common
Vulnerability Reporting Framework (CVRF). It supports a number of different profiles for various types of advisories. One of the
profiles supported by CSAF is VEX. The [CSAF website](https://www.csaf.io/) offers several videos explaining the concepts behind CSAF, as well as the
combination of CSAF and SBOM.
{{< /details >}}