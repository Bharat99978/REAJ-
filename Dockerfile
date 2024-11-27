# Use the official PHP image
FROM php:8.2-apache

# Install necessary PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql \
    && docker-php-ext-enable gd mysqli pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Copy a default index.php file
COPY ./default-index.php /var/www/html/index.php

# Expose the default HTTP port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
