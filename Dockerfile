FROM wordpress:6.6-php8.1-apache

# Copier le code WordPress et le sous-dossier coding
COPY wordpress/ /var/www/html/
COPY coding/ /var/www/html/coding/

# Activer le module mod_rewrite pour Apache
RUN a2enmod rewrite

# Copier la configuration Apache personnalisée
COPY allow-htaccess.conf /etc/apache2/conf-available/allow-htaccess.conf

# Activer cette configuration
RUN a2enconf allow-htaccess

# Exposer le port HTTP
EXPOSE 80
