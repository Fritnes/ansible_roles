Prometheus docker
=========

https://github.com/prometheus/prometheus

Author Information
------------------

Fritnes (Andrii Tarasenko)

Playbook example
------------------
- name: Install MyMonitoring
  hosts: MyMonitoring
  become: true
  vars:
    prometheus_config_git_repo: 
    prometheus_config_git_branch: 

  tasks:
    - name: Base
      import_role:
         name: Linux_BASE_fritnes

    - name: Update
      import_role:
         name: Linux_SysUpdate_fritnes

    - name: Users
      import_role:
         name: Linux_Users_fritnes
      tags:
        - users
  
    - name: Install DOCKERCE
      import_role:
         name: Linux_DOCKERCE_fritnes

    - name: Install Linux_dPrometheus_fritnes
      import_role:
        name: Linux_dPrometheus_fritnes
      tags: 
        - prometheus

    - name: Install Node Exporter
      import_role:
         name: Linux_NodeExporter_fritnes