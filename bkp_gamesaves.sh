#!/bin/bash

BKP_path="/home/$USER/Documents/Retroid_Pocket_Backups"
RP_path=$(ls /run/$USER/1000/gvfs | grep 'Retroid')
SD_path=$(ls /run/$USER/1000/gvfs/$RP_path)

cd /run/$USER/1000/gvfs/$RP_path
cd "$SD_path"

mkdir "$BKP_path"

# RetroArch Saves and States
mkdir "$BKP_path/RetroArch" && rsync -r RetroArch/saves/* "$BKP_path/RetroArch/saves"
rsync -r RetroArch/states/* "$BKP_path/RetroArch/states"

#mkdir "$BKP_path/RetroArch/states" && cp RetroArch/states/*

# Duckstation Saves
mkdir "$BKP_path/duckstation" && rsync -r duckstation/savestates/* "$BKP_path/duckstation/savestates"
rsync -r duckstation/memcards/* "$BKP_path/duckstation/memcards"

# Dolphin Saves
mkdir "$BKP_path/DolphinForHandheld" && rsync -r DolphinForHandheld/StateSaves/* "$BKP_path/DolphinForHandheld/StateSaves"
rsync -r DolphinForHandheld/GBA/Saves/* "$BKP_path/DolphinForHandheld/GBA/Saves"
