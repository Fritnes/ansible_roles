# Linux_KasmVNC_fritnes
Ansible role for install KasmVNC

### After run playbook
1) ssh to server and run command 'vncserver' for first Run
2) reboot
3) logon to kasmVNC and disable screen locking

### Todo
- [ ] Add another architecture and distros
  - [ ] arm
  - [ ] Debian
- [ ] Disable screen locking
- [ ] Add script for auto install soft

### Done
- [X] wayland

### Test on
- kubuntu 22.04

## Example playbook
- name: Install kasmVNC
  hosts: all
  become: true
  vars:
    kasmvnc_system_username: "fritnes"
    kasm_username: "kasm"
    kasm_password: "kasmkasmkasm"

  tasks:
    - name: Install kasmVNC
      import_role:
        name: Linux_KasmVNC_fritnes
