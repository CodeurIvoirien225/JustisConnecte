FROM wordpress:6.6-php8.1-apache

# Copie WordPress
COPY wordpress/ /var/www/html/

# Copie ton dossier PHP
COPY coding/ /var/www/html/coding/

# Active mod_rewrite
RUN a2enmod rewrite

# Active .htaccess
RUN bash -c 'echo "<Directory /var/www/html/>\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>" > /etc/apache2/conf-available/allow-htaccess.conf' \
    && a2enconf allow-htaccess

EXPOSE 80
