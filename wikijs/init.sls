{% from "wikijs/map.jinja" import config with context %}
{% set docker_env = config['docker_env'] %}

wikijs-net:
  docker_network.present:
  - driver: bridge
  - containers:
    - wikijs-docker-container


wikijs-docker-container:
  docker_container.running:
    - image: {{ config['image'] }}
    - port_bindings:
      - 80:3000
    - networks:
      - wikijs-net
    - environment:
      {%- for key, value in docker_env.items() %}
      - {{ key }}={{ value }}
      {%- endfor %}
    - binds:
      - /var/run/postgresql:/var/run/postgresql
    - require:
      - docker_network: wikijs-net
