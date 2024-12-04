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


- Mise en place d'une sauvegarde de fichier locale

- Nos fichiers se situent dans le chemin /var/lib/docker/volumes/f941c6b8ee4607c610e8024212fc13e6a1e749277ae269c33eb3e550b1cd9a54/_data/data/Thomas/files# 
-Créer un script a la racine de votre machine en le nommant backup.sh et mettez ceci dedans:

#!/bin/bash

# Répertoire source (vos fichiers OwnCloud)
SOURCE_DIR="/var/lib/docker/volumes/f941c6b8ee4607c610e8024212fc13e6a1e749277ae269c33eb3e550b1cd9a54/_data/data/Thomas/files/Documents/test.txt"

# Répertoire de destination pour les sauvegardes
BACKUP_DIR="/root/backups" # Remplacez par le chemin souhaité pour les sauvegardes

# Générer un nom de dossier de sauvegarde basé sur la date et l'heure
TIMESTAMP=$(date "+%d-%m-%Y_%H:%M:%S")
DEST_DIR="$BACKUP_DIR/sio2-$TIMESTAMP"

# Créer le répertoire de sauvegarde s'il n'existe pas
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Copier les fichiers et leur structure dans le répertoire de destination
echo "Sauvegarde des fichiers de $SOURCE_DIR vers $DEST_DIR..."
cp -r "$SOURCE_DIR" "$DEST_DIR"

# Vérification du succès de la sauvegarde
if [ $? -eq 0 ]; then
    echo "Sauvegarde terminée avec succès dans : $DEST_DIR"
else
    echo "Erreur lors de la sauvegarde"
fi

- rendez ce script executable avec la commande +x /backup.sh .
- executez le en faisant .backup/sh 
- Un dossier sera créer en récupérant l'intégralité des fichiers et dossiers de votre owncloud 
- Vous retrouverez votre dosiser dans le chemin cd /root/backups

- Pour sauvegarder faire ce script: 
#!/bin/bash

# Répertoire source (où se trouve test.txt)
SOURCE_DIR="/var/lib/docker/volumes/f941c6b8ee4607c610e8024212fc13e6a1e749277ae269c33eb3e550b1cd9a54/_data/data/Thomas/files"

# Répertoire de destination pour la sauvegarde
BACKUP_DIR="/root/backups" # Remplacez par le chemin souhaité si nécessaire

# Générer un nom de fichier basé sur la date et l'heure
TIMESTAMP=$(date "+%d-%m-%Y_%H:%M:%S")
BACKUP_FILE="$BACKUP_DIR/sio2-$TIMESTAMP-test.txt"

# Vérifier si le fichier test.txt existe dans le répertoire source
if [ -f "$SOURCE_DIR/test.txt" ]; then
    # Créer le répertoire de sauvegarde s'il n'existe pas
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
    fi

    # Copier le fichier test.txt vers le répertoire de destination avec un nom unique
    cp "$SOURCE_DIR/test.txt" "$BACKUP_FILE"

    # Vérifier si la copie a réussi
    if [ $? -eq 0 ]; then
        echo "Sauvegarde terminée avec succès : $BACKUP_FILE"
    else
        echo "Erreur lors de la sauvegarde"
    fi
else
    echo "Le fichier test.txt n'existe pas dans le répertoire source : $SOURCE_DIR"
fi

- Vous retrouverez votre fichier dans le chemin cd /root/backups

- Pour compresser et enregireter le dossier TOIP 
 il faut créer un fichier toip.sh
- mettre ce code: 
  GNU nano 7.2                                                                                                        toip.sh                                                                                                                 
#!/bin/bash

# Répertoire source (où se trouve le dossier Toip)
SOURCE_DIR="/var/lib/docker/volumes/f941c6b8ee4607c610e8024212fc13e6a1e749277ae269c33eb3e550b1cd9a54/_data/data/Thomas/files"

# Répertoire de destination pour la sauvegarde
BACKUP_DIR="/root/backups" # Remplacez par le chemin souhaité si nécessaire

# Nom du dossier à sauvegarder
FOLDER_NAME="TOIP"

# Générer un nom d'archive basé sur la date et l'heure
TIMESTAMP=$(date "+%d-%m-%Y_%H:%M:%S")
ARCHIVE_NAME="sio2-$TIMESTAMP-$FOLDER_NAME.tar.gz"
BACKUP_FILE="$BACKUP_DIR/$ARCHIVE_NAME"

# Vérifier si le dossier Toip existe dans le répertoire source
if [ -d "$SOURCE_DIR/$FOLDER_NAME" ]; then
    # Créer le répertoire de sauvegarde s'il n'existe pas
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
    fi

    # Créer une archive compressée du dossier Toip
    echo "Compression et sauvegarde du dossier $SOURCE_DIR/$FOLDER_NAME vers $BACKUP_FILE..."
    tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" "$FOLDER_NAME"

    # Vérification du succès de la sauvegarde
    if [ $? -eq 0 ]; then
        echo "Sauvegarde et compression terminées avec succès : $BACKUP_FILE"
    else
        echo "Erreur lors de la sauvegarde ou de la compression"
    fi
else
    echo "Le dossier $FOLDER_NAME n'existe pas dans le répertoire source : $SOURCE_DIR"
fi
- Vous retrouverez votre fichier dans le chemin cd /root/backups

- Mainteant on souhaite que ce fichier puisse être envoyé sur notre machine OMV 
- Il faut tout simplement modifier le fichier comme ci-dessous en indiquant les informations du ftp
                                                                                                             
#!/bin/bash

# Variables
SOURCE_DIR="/var/lib/docker/volumes/f941c6b8ee4607c610e8024212fc13e6a1e749277ae269c33eb3e550b1cd9a54/_data/data/Thomas/files/TOIP"  # Dossier source à sauvegarder
BACKUP_DIR="/home/test/archives_toip"  # Répertoire de sauvegarde sur la machine locale (répertoire de l'utilisateur FTP)
TIMESTAMP=$(date +"%d-%m-%Y_%H:%M:%S")  # Format de date pour nommer le fichier
ARCHIVE_NAME="sio2-$TIMESTAMP-TOIP.tar.gz"  # Nom du fichier d'archive
BACKUP_FILE="$BACKUP_DIR/$ARCHIVE_NAME"  # Chemin complet du fichier d'archive

# Connexion FTP
FTP_HOST="192.168.20.42"  # Adresse IP du serveur FTP
FTP_USER="test"  # Utilisateur FTP
FTP_PASS="sio2024"  # Mot de passe FTP
FTP_REMOTE_DIR="/home/test/archives_toip"  # Répertoire distant où sauvegarder l'archive

# Vérification si le répertoire de sauvegarde existe, sinon création
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Création du répertoire de sauvegarde local : $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
fi

# Compression et sauvegarde du dossier TOIP
