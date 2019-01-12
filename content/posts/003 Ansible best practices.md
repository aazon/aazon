---
title: "Ansible Best Practices"
date: 2019-01-12T08:19:45+02:00
#description: "Is this description will be shown?"
draft: true
tags: ["ansible"]

---

Here I will try to declare the best practices and coding guidelines for
Ansible playbooks and roles that we use. Since our DevOps team is
growing up it’s very important to follow some rules so that nobody is
confused and productivity of the whole team is maximized.

## Variables

First of all `group_vars`. They should not contain any hardcoded IP
addresses, hostnames, and similar things for the sake of reusability.
By reusability, I mean being able to apply the same playbook against
resources in different environments or different data centers. So every
time you need to define somewhere a hostname or an IP address ask
yourself aren't you nailing them down to the current environment?
Can your colleague reuse your playbook and roles later on working
with another inventory? Usually, it is a good idea to "abstract"
relations between servers by means of group names, i.e. instead of
hardcoding IP address or a hostname of the erver use its group in
group variables and move all IP address this house names and Sacharov
to the inventory file.

Another thing is default values. There one should also not declare any
credentials or IP addresses or hostile names or Loggins and so on. One
needs ask them self how this role will be reusable in different
infrastructuresFor example, let’s say you have life or production and
development environments. Let’s say that you have a role that is used
in both of them. Then it’s probably would make sense to have default
variables which are independent so that they contain some really
default values. In this case looking and the Rall itself you cannot
say whether it’s a production roll or development role. And software
development or in object oriented programming languages this would be
something like an abstract class or an interface. This brings you
read his ability so that you can easily copy and paste these Rall to
any other and simple project and you have a grantee that in the worst
case it will not work but it will never ever tried to connect with your
production servers for example.

## Naming

Another important thing is the naming convention. Looking backwards I
can say is that it’s a good idea to name servers after the man obligation
that they have running on then. For example in Gaz of my SQL database
the name of the server might be something like my SQL something. For example
in case of my SQL database the name of the cyber might be something
like mysql-something. Also it’s not the best idea to add a keyboard
that contains obligation name or purpose of this server to the server
name. For example if you have an elastic search server than your better
name it just elastic search and not elastic search minus shop. Later on
this elastic star server made to share it with some other obligation or
some other project and having the name of one of the projects in the
name of the server will confuse people. So if you need to have a
different set ups of the same service let’s say you have to databases
sorry verse then just call them a and B. And the last thing the last
but did not list is give each server and number because it may be that
today this is the only one sorry you need by tomorrow your infrastructure
will grow up. Normally we use two digits to identify the Sarver point.
However sometimes so that we say in future Rex bag this the number of
servers of the given group all early given set up to be below 100 but
we SUV that it may be more than 10. Sometimes it doesn’t make sense to
predict 100 servers for example in Gaz of name servers obviously that’s
not the case that you have like more than 10 name sorrows and normally
you have two of them. But this is probably the only one exception that
I know. Names of the groups in the inventory file should be in plural
so that when you’re riding a playbook you can understand whether it’s
a server name or a group name and this will pay off in the future.
Don’t forget that it’s possible to declare variables in group for Ables
folder in hast Laurier bills folder and in the inventory file. All the
variables should be at prefixed with the name of the role where higher
fence are substitute with_us_. This is not the perfect solution because
it’s still it’s still possible that there is a collision however since
answerable does not provide you with any term of namespace it’s