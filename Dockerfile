# Utilise l’image PHP + Apache officielle
FROM php:8.1-apache

# Copie les fichiers PHP dans le serveur Apache
COPY coding/ /var/www/html/

# Expose le port 80
EXPOSE 80
