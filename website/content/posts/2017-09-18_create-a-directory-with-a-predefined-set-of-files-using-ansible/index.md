---
title: "Using Ansible to create a directory with a predefined set of files"
slug: using-ansible-to-create-a-directory-with-a-predefined-set-of-files
aliases: 
  - create-a-directory-with-a-predefined-set-of-files-using-ansible
date: 2017-09-18T22:48:46+01:00
tags: ["ansible", "how-to"]
description: >
    Sometimes there are files that are leftovers from previous Ansible playbook executions or were
    generated in between Ansible executions by the application. In this case,
    it is hard to predict what final version of config will be generated after running ansible once again
---

Sometimes some files are leftovers from previous Ansible playbook executions or were generated in between Ansible executions by the application. 
In this case, it is hard to predict what final version of the config will be generated after running Ansible once again. 
One possible case from the real world is the main config of nginx `/etc/nginx/nginx.conf` that has a `include *.conf` statement at the very end. 
After installation, Nginx provides you with `conf.d/default.conf` that will be included. 
However, one may want to get rid of this file on production servers.

The first solution would be to explicitly remove this file:


```yaml
- name: remove default.conf
  file:
    path: "/etc/nginx/conf.d/default.conf"
    state: absent
  notify: reload nginx

```

The problem is that none is sure that all pre-defined configs have been removed.
As for today, this is enough, but tomorrow package maintainers may add other files that silently are added to your production system during installation.

The second solution would be to remove all files from `/etc/nginx/conf.d` and then add only the necessary ones:

```yaml
- name: remove all from conf.d
  shell: "rm -rf /etc/nginx/conf.d/*.conf"
  notify: reload nginx

- name: add required configs
  copy:
    src: "{{ item }}"
    dest: "/etc/nginx/conf.d/{{ item }}"
  with_items: "{{ nginx_configs }}"
  notify: reload nginx
```

The problem here is that the event `reload nginx` is triggered every time, regardless of the presence of real changes.
In other words, the playbook will not be idempotent anymore. 

The third approach would be to remove all files that are not on the "white list":

```yaml
- name: get list of files from the directory
  find:
    paths: "/etc/nginx/conf.d"
    file_type: file
    hidden: true
  register: _dir_files

- name: remove files that are not on the list
  file:
    path: "{{ item.path }}"
    state: absent
  when: "item.path | basename not in nginx_configs | default([])"
  with_items: "{{ _dir_files.files | default([]) }}"
  notify: reload nginx

- name: add required configs
  copy:
    src: "{{ item }}"
    dest: "/etc/nginx/conf.d/{{ item }}"
  with_items: "{{ nginx_configs }}"
  notify: reload nginx

```

This returns idempotency back because it triggers the `reload nginx` event only when real changes were made.

I do not consider this solution to be ideal but this snippet may be used.
