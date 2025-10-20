FROM wordpress:6.6-php8.1-apache

# Copier WordPress et ton code
COPY wordpress/ /var/www/html/
COPY coding/ /var/www/html/coding/

# Activer mod_rewrite
RUN a2enmod rewrite

# Autoriser .htaccess pour /var/www/html
RUN echo '<Directory /var/www/html/>\n\
    AllowOverride All\n\
</Directory>' > /etc/apache2/conf-available/allow-htaccess.conf && \
    a2enconf allow-htaccess

# Créer config.php dynamiquement à partir des variables d'environnement
RUN mkdir -p /var/www/html/coding/config && \
    echo "<?php
\$host = getenv('DB_HOST');
\$dbname = getenv('DB_NAME');
\$user = getenv('DB_USER');
\$pass = getenv('DB_PASS');

try {
    \$pdo = new PDO(\"mysql:host=\$host;dbname=\$dbname;charset=utf8mb4\", \$user, \$pass);
    \$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException \$e) {
    die(\"Erreur de connexion : \" . \$e->getMessage());
}
?>" > /var/www/html/coding/config/config.php

# Exposer le port HTTP
EXPOSE 80
