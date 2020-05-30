AWS VPC (Virtual Private Cloud) :
  Private network in which resources can be launched.
  Resembles a traditional network (with the benefit of using AWS Scalable infrastructure).
  
VPC is the networking layer for EC2

Key Concepts for VPCs:
  VPC: Virtual network dedicated to account.
  Subnet: Range of IPs in VPC
  Route Table: Set of rules (called routes), determines where network traffic is directed.
  Internet gateway: gateway attached to VPC, enables internet communication to VPC resources.
  VPC endpoint (Virtual private gateway): Private network tunnel between VPC and on-premises network.
  Firewalls in VPC:
    Security Groups: Virtual firewall rules at instance level to control inbound and outbound traffic.
                     An instance (EC2 or Lambda?) can have upto 5 SGs
    NACLs (Network ACLs): optional layer of security for VPC that acts as firewall for controlling traffic in and out of one or more subnets.
                          NACL rules similar to SG rules adds an additional layer of security to VPC.
