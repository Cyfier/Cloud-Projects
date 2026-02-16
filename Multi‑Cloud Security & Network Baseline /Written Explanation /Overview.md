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

