include:
  - system

# copy origin db dump
/tmp/origin.sql:
  file.managed:
    - source: salt://mysql/origin.sql
    - template: jinja
    - requere:
      - pkg: mysql-server
      - service: mysql

# copy origin db schema dump
/tmp/origin_schema.sql:
  file.managed:
    - source: salt://mysql/origin_shema.sql
    - template: jinja
    - requere:
      - pkg: mysql-server
      - service: mysql

# manage mysql config
/etc/mysql/my.cnf:
  file.managed:
    - source: salt://mysql/my.cnf
    - template: jinja
    - requere:
      - pkg: mysql-server
      - service: mysql
