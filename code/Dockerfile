# Use the official PHP Apache base image
FROM php:7.4-apache

# Install necessary extensions for MySQL and PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application code into the container
COPY . /var/www/html

# Set correct permissions for the application files
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Copy custom Apache virtual host configuration
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
