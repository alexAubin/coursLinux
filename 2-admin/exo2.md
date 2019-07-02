# Administration Linux - feuille d'exercice n.2

# 3 - Notions de réseau

### IP locale, globale, pings

- 3.1 - Dans votre VM, identifiez les interfaces réseaux, leur nom, leur adresse MAC, et leur adresse IP locale à l'aide de `ip a`. (Eventuellement, comparez avec votre ancienne machine sous Stretch). Tapez également `ip route` et identifiez l'adresse IP de passerelle / gateway utilisée (cela correspond à la route "default")
- 3.2 - Ouvrir une invite de commande *Windows* (Menu Démarrer, puis taper 'cmd'), utilisez `ipconfig` pour identifiez votre adresse IP locale et l'adresse IP de la passerelle.
- 3.3 - Dessinez un schéma de votre compréhension de l'agencement et des relations entre ces différentes entités (internet, le routeur du centre de formation, votre machine Windows, vos VMs)
- 3.4 - Faites plusieurs tests de "ping" entre toutes ces différentes machines :
     - Testez de pinguer les VM entres elles
     - Testez de pinguer l'hôte Windows depuis une VM, et vice-versa
     - Testez de pinger la gateway des VM depuis les VM ... et depuis Windows
     - Testez de pinger la gateway de l'hôte Windows depuis Windows ... et depuis les VM
- 3.5 - Essayez de pinguer les machines de vos voisins / camarades. Demandez-leur leur IP : êtes-vous capable de pinguer leur machine Windows ? Leur machines virtuelles ? Tentez de lister les IPs présentent sur le réseau local en tapant `arp -a` dans une invite de commande sur l'hôte Windows.
- 3.6 - Récupérez votre IP globale depuis Windows et depuis votre machine virtuelle, via `whatsmyip.com` ou `ip.yunohost.org`. Comparez avec votre voisin. Comparez avec votre smartphone.
- 3.7 - Dans la configuration de votre machine virtuelle, passez l'interface réseau en mode 'Bridge' (ou 'Pont') plutôt que NAT. Désactivez ensuite la connection filaire pour forcer la VM à se reconnecter au réseau. Quelle est la nouvelle adresse IP ? Refaites quelques-un des tests précédents. Tentez de scanner les IP du réseau avec `sudo arp-scan --localnet`. Êtes-vous capable de pinguer les machines de vos voisins ?
- 3.8 - Arrivez-vous à pinger `89.234.141.68` ? Utilisez `whois` pour identifier l'entité propriétaire de cette IP.
- 3.9 - (Avancé) Tentez des `traceroute` vers l'IP d'un voisin, vers wikipedia.org, google.com, yunohost.org et yoloswag.team.

### TCP, ports et protocoles

- 3.10 - Utilisez `lsof -i` pour lister les connexions actives. Arrivez-vous à identifier à quoi elle correspondent ?
- 3.11 - Testez avec `nc -zv <adresse> <port>` si certains ports sont ouverts pour la machine 89.234.141.68. Par exemple, tester les ports 22, 53, 80, 443 et 6667.
- 3.12 - Dans une console, lancez `telnet yoloswag.team 80` puis dans le sous-shell ainsi ouvert, tapez "`GET /`". Que voyez-vous apparaître ? Qu'avez-vous fait ?
- 3.13 - (~Avancé) Installez le paquet `wireshark`. Lancez cet outil en root et lancer une analyse de traffic. Vous voyez ensuite défiler les différent paquet. Ajouter un filtre pour montrer seulement le protocole HTTP. Pendant que l'analyse tourne, connectez-vous à un site en HTTP (pas HTTPS !) comme yoloswag.team, et regardez les paquets trouvés par `wireshark`. Êtes-vous capable de trouver le code source de la page en analysant ces paquets ? 

### DNS et /etc/hosts

- 3.14 - À l'aide de `host`, récupérez l'IP des machines `wikipedia.fr`, `lemonde.fr`, `yunohost.org`, `arn-fai.net` et `dismorphia.info`. Testez aussi avec `dig +short <machine>`
- 3.15 - Dans votre fichier `/etc/hosts`, ajoutez une ligne `127.0.0.1 google.fr`. Quel effet cela produit-il ? Et si vous ajoutez `92.92.115.142` à la place ?
- 3.16 - (~Avancé) Analysez où sont envoyées les requêtes DNS (port 53) avec Wireshark. En déduire quel est le résolveur DNS utilisée par le système. Remplacez le contenu du `/etc/resolv.conf` par `nameserver 89.234.141.68` et refaites des requêtes DNS. Confirmez avec `wireshark` que ces requêtes sont bien envoyées vers le nouveau résolveur.


# 4 - Notions de cryptographie

- 4.0 - Installer `gpg` si le programme n'est pas déjà présent
- 4.1 - Générer une clef GPG avec `gpg --full-generate-key`.
- 4.2 - Récupérer la clef GPG du formateur puis l'importer avec `gpg --import <chemin_vers_la_clef>`. S'assurer que la clef a bien été importée avec `gpg --list-key`.
- 4.3 - Écrire un court message pour le formateur dans un fichier (par exemple, 'Je fais du chiffrement !') puis chiffrer ce fichier avec `gpg --encrypt --armor <fichier>`.
- 4.4 - Exportez votre clef publique avec `gpg --armor --export you@example.com > mykey.asc`
- 4.5 - Envoyer un mail au formateur (éventuellement depuis `throwawaymail.com`) avec le message chiffré **et votre clef publique**.
- 4.6 - Attendre une réponse, et tenter de la déchiffrer avec `gpg --decrypt`.
