# TP-OWNCLOUD

## Etape 1: 

## Installation de OWN a l'aide Docker

- Installer OWncloud avec la commande docker pull owncloud
- Démarrer Owncloud avec la commande  docker run -p 8081 -d owncloud
- Aller sur internet et dans une url tapez @IP:8081
- Créer votre profil et terminer l'installation (Id: Thomas mdp: Sio2425$$)

## Création d'un Client Owncloud sur Windows permettant la synchronisation de fichier

- Sur une machine Windows installer le Client officiel 
- Une fois le client installé lancé l'application
- Entrer l'adresse ip de votre owncloud donc http://@IP:8081
- Entrer les identifiants de l'administrateur et vous avez enfin créer le clien owncloud configuré

## Possibilités sur owncloud 

- Connexion avec LDAP/Active Directory :

    - Permet de gérer les utilisateurs et leurs accès via un annuaire centralisé (comme LDAP ou Active - Directory).
    - Simplifie l’authentification grâce au SSO (Single Sign-On).

- Partage de fichiers sécurisé :

    - Possibilité de partager des fichiers avec d’autres utilisateurs ou via des liens externes.
    - Protection des liens par mot de passe ou expiration automatique pour garantir la sécurité.

- Synchronisation multi-plateformes :

   - Compatible avec Windows, macOS, Linux, Android et iOS pour accéder à ses fichiers depuis n’importe quel appareil.

- Sauvegarde et récupération :

    - Assure la sauvegarde automatique des fichiers et permet de restaurer des versions précédentes.

- Collaboration en temps réel :

    - Permet l’édition de documents en ligne avec d’autres utilisateurs (via des outils comme OnlyOffice ou Collabora).
- Gestion des droits utilisateurs :

    - Attribution de droits spécifiques sur les fichiers et dossiers (lecture, écriture, suppression) selon les utilisateurs ou groupes.

- Sécurité des données :

    - Chiffrement des fichiers pour protéger les données sensibles.
    - Journalisation des activités pour suivre qui accède ou modifie les fichiers.

- Extension des fonctionnalités :

    Intégration avec d’autres services (comme des applications tierces ou des API).
    Modules complémentaires pour ajouter des outils (agenda, gestion de notes, etc.).


## Etape2:

- Création d'un repertoire toip sur le serveur cloud et fichier:

- Cliquer sur votre profile en haut a droite, allez dans utilisateurs et rajouter votre utilisateur au groupe Sio (pensez a le créer avant)
- Sur l'interface web owncloud aller dans Fichers
- Créer un dossier nommé "Toip"
- Ciquez sur partagé et choisissez votre groupe "Sio"
- Dans ce dossier il faut créer un fichier "Test" en .txt, si on voudrait un fichier .csv il faudrait installé une version de php sur notre owncloud
- Partagé ce fichier a votre groupe "Sio"
- Sur votre machine cliente, aller dans votre explorateur de fichier -> un raccourci ownCloud existe, cliquez dessus -> Votre dossier TOIP apparait et votre fichier que vous pouvez modifier
- Ecrivez dans ce fichier, retournez sur interface web pour vérifier que votre machine 
- Vous pouvez aussi faire un clique droit sur ce dossier, créer un raccourci sur votre bureau et il continuera a enregistrer sur le cloud (test avec le fichier bonjour)


## Etape3 :
- Mise en place d'une sauvegarde de fichier locale

- Nos fichiers se situent dans le chemin /var/lib/docker/volumes/f941c6b8ee4607c610e8024212fc13e6a1e749277ae269c33eb3e550b1cd9a54/_data/data/Thomas/files# 
-Créer un script a la racine de votre machine en le nommant backup.sh et mettez ceci dedans (voir fichier backup.sh)

- rendez ce script executable avec la commande +x /backup.sh .
- executez le en faisant .backup/sh 
- Vous retrouverez votre fichier sauvegarder dans le chemin cd /root/backups

 
- Pour compresser et enregireter le dossier TOIP il faut créer un fichier toip.sh (voir fichier)
- rendez ce script executable avec la commande +x /toip.sh .
- executez le en faisant ./toipsh 
- Vous retrouverez votre fichier sauvegarder dans le chemin cd /root/backups


- Mainteant on souhaite que ce fichier puisse être envoyé sur notre machine OMV 
- Il faut tout simplement modifier le fichier toip.sh  les informations du ftp (voir fichier toipftp.sh)
- rendez ce script executable avec la commande +x /toipftp.sh .
- executez le en faisant ./toipftp.sh
- Vous retrouverez votre fichier sauvegarder dans le chemin cd /root/backups de votre machine et dans le dossier archives_toip de votre machine cliente ftp

                                                                                                             
