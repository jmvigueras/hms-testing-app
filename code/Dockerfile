# Base image
FROM php:8.1-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    vim \
    curl \
    default-mysql-client \
    libzip-dev \
    libonig-dev \
    libpng-dev \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set up MySQL to start
RUN service mysql start

# Copy DB sql init DB
COPY . /var/www/bluebirdhotel.sql

# Set root password and create database
RUN mysql -e "ALTER USER 'root'@'$DB_HOST' IDENTIFIED WITH '$DB_PASSWORD'' BY 'root';" && \
    mysql -u root -p "$DB_PASSWORD" < /var/www/bluebirdhotel.sql

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
