# How Would I Improve This In The Future ?

This project is intentionally foundational. Here are enhancements that could elevate it even further:

## Identity & Access

- Integrate Entra ID Conditional Access policies

- Add workload‑level RBAC (e.g., Kubernetes RBAC, database roles)

- Automate Azure → AWS SCIM provisioning

## Networking

- Add private endpoints and service endpoints in Azure

- Implement Transit Gateway or Azure Virtual WAN for multi‑region expansion

- Add centralized logging and flow log

## Governance 

- Migrate Azure Policy to the AzAPI provider for full IaC automation

- Add AWS Organizations SCPs for account‑level guardrails

- Implement drift detection and compliance reporting

## Security

- Add Key Vault / KMS encryption baselines
  
- Implement SIEM/SOAR integrations
  
- Add vulnerability scanning and IaC security checks

## Operational Excellence

- Add CI/CD pipelines for staged Terraform deployment

- Add automated documentation generation

- Add monitoring baselines (CloudWatch, Azure Monitor)
