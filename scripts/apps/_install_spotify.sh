#!/bin/bash
# https://www.spotify.com/us/download/linux/
# -------------------------------------------------------------------------------------------------------------------------------------------
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -yy
# Si la première connexion ne fonctionne pas, il faut vérifier le navigarteur par defaut (ne fonctionne pas avec Konqueror)
