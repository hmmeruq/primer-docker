# Usa la imagen base de PHP con Apache
FROM php:7.4-apache

# Instala las extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copia los archivos de GLPI al contenedor
COPY ./glpi /var/www/html/glpi

# Configura permisos
RUN chown -R www-data:www-data /var/www/html/glpi

# Habilita el módulo de reescritura de Apache
RUN a2enmod rewrite

# Expone el puerto 80
EXPOSE 80
