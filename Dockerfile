# Utilise l’image PHP + Apache officielle
FROM php:8.1-apache

# Copie les fichiers PHP dans le serveur Apache
COPY coding/ /var/www/html/

# Expose le port 80
EXPOSE 80


FROM wordpress:6.6-php8.1-apache

# Copier tout le contenu WordPress
COPY wordpress/ /var/www/html/

# Expose le port 80
EXPOSE 80