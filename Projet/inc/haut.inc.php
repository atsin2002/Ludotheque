<!Doctype html>
<html>
    <head>
        <title>LUDOTECH</title>
        <link rel="stylesheet" href="inc/css/style.css" />
    </head>
    <body>    
        <header>
			<div class="conteneur">                      
				<span>
					<a href="" title="Mon Site">LUDOTECH</a>
                </span>
				<nav>
					<?php
					if(internauteEstConnecteEtEstAdmin()) // admin
					{ // BackOffice
						echo '<a href="admin/gestion_membre.php">Gestion des membres</a>';
						echo '<a href="admin/gestion_commande.php">Gestion des commandes</a>';
						echo '<a href="admin/gestion_boutique.php">Gestion de la boutique</a>';
					}
					if(internauteEstConnecte()) // membre et admin
					{
						echo '<a href="profil.php">Voir votre profil</a>';
						echo '<a href="boutique.php">Accés à la boutique</a>';
						echo '<a href="panier.php">Voir votre panier</a>';
						echo '<a href="connexion.php?action=deconnexion">Se déconnecter</a>';
					}
					else // visiteur
					{
						echo '<a href="inscription.php">Inscription</a>';
						echo '<a href="connexion.php">Connexion</a>';
						echo '<a href="boutique.php">Accés à la boutique</a>';
						echo '<a href="panier.php">Voir votre panier</a>';
					}
					// visiteur=4 liens - membre=4 liens - admin=7 liens
					?>
				</nav>
			</div>
        </header>
        <section>
			<div class="conteneur">       