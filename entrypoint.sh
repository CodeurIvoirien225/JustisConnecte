{\rtf1}#!/bin/bash
# Créer le fichier config.php au démarrage
mkdir -p /var/www/html/coding/config
cat > /var/www/html/coding/config/config.php <<EOL
<?php
\$host = getenv('DB_HOST');
\$dbname = getenv('DB_NAME');
\$user = getenv('DB_USER');
\$pass = getenv('DB_PASS');

try {
    \$pdo = new PDO("mysql:host=\$host;dbname=\$dbname;charset=utf8mb4", \$user, \$pass);
    \$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException \$e) {
    die("Erreur de connexion : " . \$e->getMessage());
}
?>
EOL

# Lancer Apache
apache2-foreground
