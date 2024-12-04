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



