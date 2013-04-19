nginxconf:
  file.managed:
    - name: /etc/nginx/sites-enabled/{{ pillar['project_name'] }}
    - source: salt://nginx/nginx.conf
    - template: jinja
    - makedirs: True
    - mode: 755

nginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: nginxconf

/var/log/nginx:
  file.directory:
    - group: {{ pillar['web_group'] }}
    - user: {{ pillar['web_user'] }}
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - group
      - user
      - mode