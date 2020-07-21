{% from "cron_email_backup_fail_check/map.jinja" import config with context %}
{% set docker_env = config['docker_env'] %}


wikijs-docker-container:
  docker_container.running:
    - image: {{ config['image'] }}
    - port_bindings:
      - 3000
    - environment:
      {%- for key, value in docker_env.iteritems() %}
      - {{ key }}={{ value }}
      {%- endfor %}