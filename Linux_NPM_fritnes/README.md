# Linux_NPM_fritnes
Ansible role for install Nginx Proxy Manager (https://nginxproxymanager.com/)

## Example playbook
- name: Install NPM
  hosts: all
  become: true
  vars:
    npm_internal_ip: "192.168.0.10"

  tasks:
    - name: Install NPM
      import_role:
        name: Linux_NPM_fritnes
