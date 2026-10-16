# Fritnes Ansible Roles

Personal Ansible roles for Linux hosts and Docker services.

## Use

Clone the repository and use its root as the roles path:

```sh
git clone https://github.com/fritnes/ansible_roles.git
cd ansible_roles
ansible-playbook -i /path/to/inventory /path/to/site.yml
```

The included `ansible.cfg` sets `roles_path` to this repository. Set secret values with Ansible Vault; do not commit plaintext passwords.

## Role Catalog

| Role | Purpose |
| --- | --- |
| `Linux_BASE_fritnes` | Common host packages and base setup |
| `Linux_BlackboxExporter_fritnes` | Blackbox Exporter container |
| `Linux_DOCKERCE_fritnes` | Docker CE installation |
| `Linux_DOCKERtmp_fritnes` | Docker Compose service scaffold |
| `Linux_Dashy_fritnes` | Dashy container |
| `Linux_dMinecraftServer_fritnes` | Minecraft server container |
| `Linux_dPrometheus_fritnes` | Prometheus and Grafana containers |
| `Linux_dWORDPRESS_fritnes` | WordPress and MariaDB containers |
| `Linux_Jenkins_fritnes` | Jenkins container |
| `Linux_KasmVNC_fritnes` | KasmVNC installation |
| `Linux_Loki_fritnes` | Loki container |
| `Linux_MALTRAIL_fritnes` | Maltrail installation |
| `Linux_monerooceanXMR_fritnes` | XMRig service |
| `Linux_NFtables_fritnes` | nftables and Fail2ban setup |
| `Linux_NodeExporter_fritnes` | Prometheus Node Exporter |
| `Linux_NPM_fritnes` | Nginx Proxy Manager container |
| `Linux_PROXMOX_fritnes` | Proxmox Fail2ban configuration |
| `Linux_SysUpdate_fritnes` | Explicit system package upgrades |
| `Linux_Users_fritnes` | User and SSH management |
| `Linux_WGClient_fritnes` | WireGuard client |
| `Linux_WGServer_fritnes` | WireGuard UI server container |
| `RP_Store_fritnes` | Samba file-share setup |

## Required Inputs

Container roles require a numeric version tag or SHA-256 image digest, rather than silently tracking moving tags such as `latest`:

| Role | Variables |
| --- | --- |
| Blackbox Exporter | `blackbox_exporter_image` |
| Dashy | `dashy_image` |
| Jenkins | `jenkins_image` |
| Minecraft | `MinecraftServer_image` |
| Nginx Proxy Manager | `npm_image` |
| Prometheus and Grafana | `prometheus_image`, `grafana_image` |
| WordPress and MariaDB | `dwordpress_wordpress_image`, `dwordpress_mariadb_image` |
| WireGuard UI | `wgui_image` |

Supply unique secrets of at least 16 characters for `grafana_admin_password`, `dwordpress_db_password`, `WGUI_PASSWORD`, and `kasm_password`. Store them in Ansible Vault. Compose files containing secrets are written with mode `0600`.

In `Linux_Users_fritnes`, passwordless wheel sudo and home-directory deletion are disabled by default. Set `passwordless_sudo_wheel: true` or `delete_user_home: true` only when explicitly intended. Jenkins Docker socket access is disabled by default; enabling it grants jobs host-level control, and requires `jenkins_docker_gid`.

The built-in nftables policy permits SSH and drops other inbound traffic. Provide `nftables_config_path` for a host-specific ruleset; it takes precedence over the built-in template.

## Validation

GitHub Actions syntax-checks all roles. `ansible-lint tests/syntax.yml` is currently advisory while legacy roles are brought into compliance. Package upgrades belong in `Linux_SysUpdate_fritnes`, not service installation roles.
