# Multi‑Cloud Security & Network Baseline – Azure AD + AWS SSO with Governance Controls

This project implements a fully modular, enterprise‑grade multi‑cloud foundation across Azure and AWS. It establishes a unified identity plane, secure network segmentation, and governance guardrails using a staged Terraform architecture that mirrors real‑world Landing Zone patterns.
The design emphasizes security, identity‑first architecture, and cloud‑agnostic network baselines, providing a scalable and compliant foundation for future workloads across both clouds.

## Architecture Overview

This project is built around three core pillars: 

- Identity & Access Management (Entra ID + AWS IAM Identity Center)

- Network Baseline (Azure VNets + AWS VPCs)

- Governance Controls (Tagging, Region Restrictions, Public IP Guardrails)

Each layer is deployed independently using Terraform, reducing blast radius and reflecting how enterprise platform teams structure multi‑cloud foundations

## Identity & Access Management

### Entra ID as the Unified Identity Source

The project begins by establishing Azure AD as the central identity provider. Terraform provisions:

- Entra ID security groups for role‑based access

- Groups mapped to cloud‑specific roles (e.g., Azure Admins, AWS PowerUsers, AWS ReadOnly)

- A Kubernetes Admin group as an example of how identity can extend into application‑level governance

### AWS IAM Identity Center Integration

AWS IAM Identity Center (SSO) is configured to use Azure AD groups as the source of truth for access. Terraform provisions:

- AWS Permission Sets (ReadOnly, PowerUser, SecurityAudit)

- Assignments mapping Azure AD groups → AWS roles

- A clean, scalable identity federation pattern

### Why This Matters

This identity plane solves several real‑world pain points:

- Eliminates long‑lived IAM credentials

- Centralizes access control across clouds

- Ensures consistent RBAC and least‑privilege enforcement

- Provides a foundation for future governance (e.g., Kubernetes RBAC, application‑level roles)

The Kubernetes Admin group is included as an example of how identity can extend beyond cloud access into workload governance, demonstrating how platform teams enforce consistent access patterns across infrastructure and applications.

## Network Baseline

### Azure Network Foundation

Terraform provisions a secure, segmented Azure network including:

- A hub‑style VNet

- Subnets for future workloads

- NSGs enforcing least‑privilege traffic

- A Standard Public Load Balancer with a static public IP

This creates a production‑ready Azure network aligned with enterprise patterns.

### AWS Network Foundation

The AWS side mirrors the same principles:

- VPC with public and private subnets

- Route tables, NAT gateway, and IGW

- Security Groups enforcing controlled ingress/egress

- Application Load Balancer for future workloads

### Why This Matters

This network baseline solves common multi‑cloud challenges:

- Prevents flat, insecure network topologies

- Establishes segmentation from day one

- Ensures consistent traffic control across clouds

- Provides a foundation for private endpoints, service meshes, or future compute layers

## Governance Controls

Although AzureRM v4.x removed Terraform support for Azure Policy resources, governance controls were still applied manually to ensure a secure baseline. These include:

### Tag Enforcement

Ensures all resources include required metadata such as:

- Owner

- Enviornment

- Cost Center

This supports cost management, accountability, and automation.

### Region Restrictions

Prevents resource sprawl by limiting deployments to approved regions.

### Public IP Guardrails

A custom policy was applied to:

- Deny all public IPs

- Except those explicitly tied to approved load balancers

This enforces secure‑by‑default patterns while allowing necessary ingress points.

### AWS Governance

AWS governance controls include:

- S3 public access block

- IAM guardrails preventing wildcard permissions

- Tag enforcement through IAM conditions

### Why This Matters

Governance is often the missing piece in cloud foundations. These controls:

- Prevent misconfigurations

- Enforce compliance

- Reduce attack surface

- Ensure consistent deployments across teams

Even though Azure Policy was applied manually, the design reflects real enterprise governance patterns.

### Business & Technical Pain Points Solved

-  Identity Fragmentation Across Clouds

Unified identity eliminates duplicate IAM management and enforces consistent RBAC

- Inconsistent Security Baselines

Governance guardrails prevent insecure deployments before they happen.

- Network Sprawl

Segmented VNets/VPCs enforce structure and reduce lateral movement risk.

- Terraform Monolith Complexity

Staged architecture avoids circular dependencies and improves maintainability.

- Lack of Reproducibility

Everything is codified, modular, and redeployable




