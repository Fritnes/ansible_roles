# Linux_WORKSTATION_fritnes

Install the desktop applications and repository setup from the AnsibleWORKSTATION repository on Ubuntu.

```yaml
- name: Configure workstation
  hosts: workstations
  become: true
  roles:
    - role: Linux_WORKSTATION_fritnes
      vars:
        workstation_dist_upgrade: false
```

The role adds the configured PPAs, the Spotify APT repository, Firefox package pinning, and the source repository's workstation package set. It requires Ubuntu and root privileges. Repository and package failures are not ignored.

`workstation_dist_upgrade` defaults to `false`; set it to `true` only when this run should upgrade the whole system. Customize `workstation_ppa_repositories` and `workstation_packages` to match the workstation. Set `workstation_enable_spotify: false` to skip Spotify and `workstation_manage_firefox_preferences: false` to skip its APT pinning.