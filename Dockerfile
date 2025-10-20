FROM wordpress:6.6-php8.1-apache

# Copier WordPress et ton code
COPY wordpress/ /var/www/html/
COPY coding/ /var/www/html/coding/

# Activer le module mod_rewrite
RUN a2enmod rewrite

# Autoriser .htaccess pour /var/www/html
RUN echo '<Directory /var/www/html/>\n\
    AllowOverride All\n\
</Directory>' > /etc/apache2/conf-available/allow-htaccess.conf && \
    a2enconf allow-htaccess

# Copier le script d'initialisation pour créer config.php au démarrage
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exposer le port HTTP
EXPOSE 80


# Installer le driver PDO MySQL
RUN apt-get update && apt-get install -y default-mysql-client \
    && docker-php-ext-install pdo pdo_mysql

# Utiliser le script d'entrypoint au démarrage
CMD ["/entrypoint.sh"]
