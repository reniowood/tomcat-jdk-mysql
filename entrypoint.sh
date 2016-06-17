#!/bin/bash

mysql_install_db --user mysql > /dev/null

cat > /tmp/sql <<EOF
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
EOF

mysqld --bootstrap --verbose=0 < /tmp/sql
rm -rf /tmp/sql

mysqld
