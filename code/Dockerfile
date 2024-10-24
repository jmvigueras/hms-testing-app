# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set non-interactive mode for apt-get (prevents interaction prompts)
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install Apache, MySQL, PHP, and other dependencies
RUN apt-get update && apt-get install -y \
    apache2 \
    mysql-server \
    php \
    libapache2-mod-php \
    php-mysql \
    && apt-get clean

# Enable Apache mods and PHP module
RUN a2enmod rewrite

# Delete default index.html
RUN rm /var/www/html/index.html

# Copy application files to the container
COPY . /var/www/html/

# Set correct permissions for the application files
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Copy custom Apache virtual host configuration
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Copy custom entrypoint script to handle MySQL initialization and service start
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose port 80 for Apache
EXPOSE 80

# Start MySQL and Apache using the custom entrypoint script
CMD ["docker-entrypoint.sh"]
