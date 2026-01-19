# Azure Autoscaling Compute Environment Using VMSS and Load Balancer

## Executive Summary

This project demonstrates how to design and deploy a secure, scalable, and cost‑efficient web application architecture using Azure Virtual Machine Scale Sets (VMSS), a Public Load Balancer, and private-only virtual machines. The solution automatically scales based on real-time demand, ensuring high availability during traffic spikes while minimizing costs during low-usage periods.

This mirrors how modern enterprises handle unpredictable workloads such as flash sales, marketing campaigns, or seasonal surges.

## Real World Scenario

A national retail company experiences massive traffic spikes during promotional events. Their legacy fixed-size VM deployment caused slowdowns and outages during peak demand, resulting in lost revenue and poor customer experience.

To solve this, the company migrates their front-end application to Azure using:

- A VM Scale Set for elastic compute

- A Public Load Balancer for traffic distribution

- Autoscale rules based on CPU thresholds

- Private-only VM instances for security

- A Jumpbox/Bastion for secure administrative access

This architecture ensures the application remains responsive during high-traffic events and cost-efficient during normal operation.

## Architecture Overview

### Key Components

- Virtual Network (VNet)

  - Provides isolated networking for all resources
 
- Public Load Balancer

  - Acts as the single public entry point for all incoming traffic
 
- VM Scale Set (VMSS)

  - Hosts multiple identical VM instances that scale automatically
 
- Autoscale Rules

  - Scale out when CPU > 70%
 
  - Scale in when CPU < 40%
 
- Health Probe

  -  Ensures only healthy VM instances receive traffic
 
- Network Security Group (NSG)

  - Restricts inbound traffic and enforces least privilege
 
- Jumpbox or Azure Bastion

  - Provides secure internal access to private VMs
 
### Traffic Flow

Internet → Public IP → Load Balancer → Backend Pool → VMSS Instances

All VMSS instances remain private and inaccessible from the internet

## Problem Statement 

The Company’s existing infrastructure could not handle sudden traffic surges. Their static VM deployment resulted in:

- Performance degradation during peak events

- Manual scaling that was slow and error-prone

- High costs from overprovisioning resources

- Security risks due to public-facing VMs

They needed a solution that was scalable, secure, automated, and cost‑optimized.

## Solution Design

### VM Scale Set Deployment

A VMSS was deployed with a minimum of 2 instances and a maximum of 10. Each instance runs the same application image and automatically joins the backend pool.

<img width="1203" height="1242" alt="Scaling Rules" src="https://github.com/user-attachments/assets/84fe4cc5-efbd-4dd0-8cbf-c31f6213df31" />

### Public Load Balancer 

A Standard SKU Public Load Balancer was created with:

- A static public IP

- A frontend configuration

- A backend pool linked to the VMSS

- A TCP health probe

- A load-balancing rule mapping port 80 → 80

<img width="1032" height="623" alt="Public Load Balancer" src="https://github.com/user-attachments/assets/19c0c8e8-4b61-4e42-8a56-6b3bcd231b66" />

### Autoscale Configuration

Autoscale rules were configured to respond to CPU usage (see first figure to see configuration):

- Scale Out: Add 1 instance when CPU > 70% for 10 minutes

- Scale In: Remove 1 instance when CPU < 40% for 10 minutes

- Cooldown: 5 minutes

This ensures elasticity without oscillation.

### Security Hardening

- All VMSS instances have no public IPs

- NSG restricts inbound traffic to only what the LB and health probe require

- Administrative access is provided through a jumpbox (cost‑effective) or Azure Bastion (enterprise-grade)

## Deployment Steps

1. Create the Virtual Network and subnets

2. Deploy the VM Scale Set

3. Create the Public Load Balancer

4. Configure frontend, backend pool, health probe, and LB rule

5. Attach VMSS to the backend pool

6. Remove public IPs from VMSS instances

7. Deploy a jumpbox or Bastion for secure access

8. Configure autoscale rules

9. Validate scaling behavior with load testing

<img width="1126" height="897" alt="List of Resources" src="https://github.com/user-attachments/assets/b0a43186-9955-44ed-bd79-ef71961ed18c" />

## Validation & Testing

To verify the solution:

- A load generator was used to simulate high traffic

- CPU usage increased above 70%

- VMSS automatically scaled out

- Load Balancer distributed traffic across new instances

- After load decreased, VMSS scaled back in

- Health probe correctly removed unhealthy instances

This confirmed the architecture’s resilience and elasticity.

## Business Impact

The new architecture provides:

- Zero downtime during traffic spikes

- Automatic scaling without human intervention

- Improved security through private-only VMs

- Cost savings by scaling down during low demand

- High availability through health probes and LB distribution

The Company now delivers a consistent, fast user experience during major sales events.

## Conclusion 

This project demonstrates a complete, production-grade Azure architecture that balances scalability, security, and cost efficiency. It reflects real-world cloud engineering practices and showcases the ability to design resilient systems capable of handling unpredictable workloads.

