# Azure Budget Monitoring and Cost Governance

## Business Problem/Scenario

A business manages multiple Azure subscriptions however lacks a unified mechanism to do the following:

- Detect cost overruns at both the subscription and organizational level

- Forecast future spend

- Enforce consistent cost governance across new and existing resources

- Ensure cost‑allocation tags were applied for accurate reporting

This resulted in unpredictable billing, limited visibility, and inconsistent governance across the environment.

## Solution Overview

I designed and implemented a multi layered Azure Cost Governance Framework that provides:

- Company level budget for high‑level financial oversight

- Subscription‑level budgets with stricter thresholds for granular control

- Forecast‑based alerts to detect overspend before it occurs 

- Action Group–based alert routing to ensure notifications reach the correct email addresses 

- Tag enforcement policies to standardize cost attribution 

- Optional automation (DINE policy) to auto‑create budgets for new subscriptions 

This framework ensures consistent, scalable, and automated cost governance across the entire Azure environment.

## Technical Architecture

### Multi-Scope Budgeting

1. Billing Account Level Budget

  - Provides a birds‑eye view of total organizational spend

  - Uses forecasted cost alerts for proactive financial planning

<img width="1600" height="849" alt="Overall Budget" src="https://github.com/user-attachments/assets/f21021c9-7282-4d13-89b4-066d554fcf4b" />

2. Subscription Level Budget

  - Enforces stricter thresholds to prevent runaway resource costs
    
  - Ensures each subscription stays within its allocated budget

<img width="688" height="608" alt="RG Budget" src="https://github.com/user-attachments/assets/66043c7b-56d3-4008-8939-4bab3da629bb" />

This layered approach supports both granular and enterprise wide cost visibility.

## Alert Routing Challenge & Resolution

### Challenge:

Azure does not allow the subscription’s primary billing email to be used directly as a Budget Alert recipient

### Resolution:

Implemented an Azure Monitor Action Group to route alerts to the billing email indirectly.

- Action Group configured with the billing email as a notification target

- Budget alerts linked to the Action Group

- Ensures reliable delivery of cost alerts despite Azure’s identity restrictions

<img width="1270" height="521" alt="Budget Email Push" src="https://github.com/user-attachments/assets/e939b33e-50a9-442d-bb5b-65d96f0a7a50" />

This demonstrates practical troubleshooting and understanding of Azure’s operational constraints.

## Governance via Azure Policy

Added Azure Policy to enforce consistent cost governance:

- Required Tag Policy

  - Enforces tags such as CostCenter, Owner, and Environment
 
  - Ensures accurate cost allocation and reporting

- Deny Policy for Missing Tags

  - Blocks deployments that do not include required tags
 
  - Prevents untracked or orphaned spend
 
<img width="1205" height="499" alt="Require Tags Policy" src="https://github.com/user-attachments/assets/81e9cff9-9760-43c3-8af4-53592ddba8af" />

These policies ensure all resources adhere to organizational cost governance standards.

## Optional Automation: DeployIfNotExists (DINE) Policy

Included the ability to extend the framework with a DeployIfNotExists policy to automatically create

- Default subscription‑level budgets

- Predefined thresholds

- Preconfigured Action Groups

This enables hands‑off governance, ensuring new subscriptions are automatically brought under cost control without manual configuration.

(If the subscription type does not support this policy, the design still accommodates it for future scalability.)

## Scalability & Future‑Proofing:

The framework is designed to scale automatically as the environment grows:

- New subscriptions inherit governance through the Billing Account or Management Group

- Tag policies apply to all existing and future resources

- Action Groups centralize alert routing

- Optional DINE automation ensures new subscriptions receive default budgets

This ensures long‑term consistency and reduces operational overhead.

## Business Impact:

- Prevents unexpected cloud spend

- Improves financial visibility for leadership

- Standardizes cost governance across all subscriptions

- Reduces manual effort through automation and policy enforcement

- Ensures accountability through required tagging

- Enables proactive cost management via forecast alerts

## Summary

This project delivers a complete, scalable, and automated Azure Cost Governance Framework that combines:

- Multi‑scope budgeting

- Automated alert routing

- Tag enforcement

- Optional budget automation

- Enterprise‑grade scalability

It demonstrates governance maturity, and the ability to design solutions that align with both technical and business requirements.
