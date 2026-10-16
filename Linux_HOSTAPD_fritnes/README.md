# Linux_HOSTAPD_fritnes

Install and configure Hostapd on Debian-family systems. The wireless interface must support AP mode and be available to Hostapd.

```yaml
- name: Configure wireless access point
  hosts: access_points
  become: true
  vars:
    hostapd_country_code: "US"
    hostapd_ssid: "Example Wi-Fi"
    hostapd_wpa_passphrase: "{{ vault_hostapd_wpa_passphrase }}"
  roles:
    - Linux_HOSTAPD_fritnes
```

Store the passphrase in Ansible Vault. The role accepts 8-63 printable ASCII characters and writes the Hostapd configuration with mode `0600`. It defaults to WPA2-PSK with CCMP, and requires an explicit two-letter uppercase regulatory country code.