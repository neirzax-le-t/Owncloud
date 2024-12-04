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





