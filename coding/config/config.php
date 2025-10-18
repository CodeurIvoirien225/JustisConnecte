<?php
$host = "localhost";
$dbname = "avocat_client_db";
$user = "root";   // ou ton user phpMyAdmin
$pass = "SYSCOA90";       // ou ton mot de passe phpMyAdmin

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Connexion réussie !"; // décommenter pour tester
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
?>
