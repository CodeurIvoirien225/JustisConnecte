FROM wordpress:6.6-php8.1-apache

# Copier WordPress et le dossier PHP
COPY wordpress/ /var/www/html/
COPY coding/ /var/www/html/coding/

# Activer mod_rewrite
RUN a2enmod rewrite

# Créer proprement la config pour AllowOverride
RUN bash -c "cat > /etc/apache2/conf-available/allow-htaccess.conf <<'EOF'
<Directory /var/www/html/>
    AllowOverride All
    Require all granted
</Directory>
EOF" && a2enconf allow-htaccess

EXPOSE 80
