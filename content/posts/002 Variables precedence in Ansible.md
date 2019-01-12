---
title: "Variables Precedence in Ansible"
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

When writing Ansible roles there are different places where one can define variables. The question is basically where to define yet another variable? In particular tricky part is to choose between group_vars and inventory, host_vars and inventory defaults and vars inside the role.

## Group variables vs inventory variables

Normally people describe all servers in one inventory file. If company has more than one data center it makes sense to have one inventory file per data center. 

All internal IP addresses or hostnames that should be hard coded, for example

