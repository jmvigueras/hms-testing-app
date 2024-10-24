#!/bin/bash

# Start MySQL service
service mysql start

# Wait for MySQL to fully start
sleep 5

# Initialize the MySQL database if it doesn't already exist
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root -p "$DB_PASSWORD" < /var/www/html/bluebirdhotel.sql

# Start Apache service in the foreground
apache2ctl -D FOREGROUND