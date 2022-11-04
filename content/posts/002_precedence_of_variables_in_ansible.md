---
title: "Precedence of Variables in Ansible"
slug: precedence-of-variables-in-ansible
date: 2019-01-06T00:03:49+01:00
draft: true
tags: ["ansible"]

---

According to official docs:

- Command line parameter
- Inventory
- Host vars
- Group vars
- Variables at playbook level
- Variables at role level
- Default values in role

There are different places to define variables when writing Ansible roles. 
The question is where to define a yet another variable?
In particular, a tricky part is to choose between group-vars and the inventory, host-vars and inventory defaults and vars inside the role.

## Group variables vs inventory variables

Normally, people describe all servers in the inventory file. 
If a company has more than one data center it makes sense to have one inventory file per data center. 

All internal IP addresses or hostnames that should be hard coded, for example
