FROM wordpress:6.6-php8.1-apache

# Copier WordPress et le dossier coding
COPY wordpress/ /var/www/html/
COPY coding/ /var/www/html/coding/

# Copie ton dossier PHP
COPY coding/ /var/www/html/coding/

# Active mod_rewrite
RUN a2enmod rewrite

# Active .htaccess
RUN bash -c 'echo "<Directory /var/www/html/>\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>" > /etc/apache2/conf-available/allow-htaccess.conf' \
=======
# Activer mod_rewrite
RUN a2enmod rewrite

# Créer proprement la config pour AllowOverride avec une here-doc
RUN bash -lc "cat > /etc/apache2/conf-available/allow-htaccess.conf <<'EOF'\n<Directory /var/www/html/>\n    AllowOverride All\n    Require all granted\n</Directory>\nEOF" \
    && a2enconf allow-htaccess

EXPOSE 80
