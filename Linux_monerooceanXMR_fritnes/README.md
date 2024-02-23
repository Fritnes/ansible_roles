# Linux_monerooceanXMR_fritnes
Ansible role for install https://github.com/MoneroOcean/xmrig

## Example playbook
- name: First Install
  hosts: all
  become: true
  vars:
    xmrig_vollet: "YOUR VOLLET"

- name: Install monerooceanXMR
  import_role:
     name: Linux_monerooceanXMR_fritnes

### Todo
- [ ] Add work time
