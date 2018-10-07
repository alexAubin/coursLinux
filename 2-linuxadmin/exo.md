
# Administration Linux - feuille d'exercice n.1

# 1 - Installer Linux

- 1.1 - Rendez vous sur le site de Linux Mint. Choisissez un environnement graphique et télécharger l'ISO correspondante. (Si vous souhaitez utiliser KDE, il vous faudra aller chercher la version 18.3)
- 1.2 - Pendant que l'image télécharge, trouvez le programme `sha256sum.exe`. Cherchez comment ouvrir une console sous Windows ete comment lancer ce programme pour calculer des hash. Une fois le téléchargement de l'ISO terminé,  vérifier l'intégrité de l'image téléchargée avec ce programme.
- 1.3 - Créer une nouvelle machine virtuelle en suivant les instructions :
    - de type Linux, avec comme version "Other Linux (64-bit)" ;
    - 2048 Mo de RAM semble raisonnable ;
    - créer un disque dur virtuel, de type VDI, dynamiquement alloué, de 16 Go.
- 1.4 - Utilisez l'ISO téléchargée en tant que CD Rom virtuel que vous insérez dans la machine virtuelle. Pour ce faire : dans Configuration, Stockage, cliquer sur le CD rom (vide) puis, sur l'icone de CD rom toute à droite, et choisir l'ISO téléchargée.
- 1.5 - Démarrer la machine : Linux Mint est censé se lancer (utiliser le mode de compatibilité sinon)
- 1.6 - Lancer l'installation de Linux Mint
    - choisir sa langue et son clavier
    - accepter l'installation des logiciels tiers 
    - lors du choix du type de partitionnement, **cliquer sur "Autre chose"**
    - créer une nouvelle table de partition, puis partitionner à l'aide du "+" l'espace de la manière suivante : 
         - 300 Mo pour `/boot` en ext4
         - 11 Go pour `/` en ext4
         - 5 Go pour `/home` en ext4
         - le reste (~700 Mo) en swap
    - choisissez le fuseau horaire, puis un nom d'utilisateur, de machine, et un mot de passe.
    - lancez l'installation et prenez une pause, buvez un café, ou regardez la vidéo youtube "The UNIX operating system" et laissez Brian Kernighan vous parler de l'élégance des pipes !
- 1.7 - Redémarrez la machine et logguez-vous. Mettez-vous à l'aise et prenez vos marques dans votre nouvel environnement :
    - choisissez un nouveau fond d'écran, naviguez dans les fichiers, testez le menu démarrer
    - choisissez un thème de couleur pour le terminal (Edition > Preferences > Couleurs)
    - personnalisez votre PS1 et vos alias
    - testez le copier-coller dans la console. Vous pouvez utiliser clic droit puis "Copier" et "Coller", ou bien Ctrl+Shift+C et Ctrl+Shift+V, ou bien sélectionner du texte et utiliser le clic du milieu de la souris.
    - tapez quelques commandes et tentez de maîtriser des raccourcis comme Ctrl+R, Ctrl+U/K, Ctrl+A/E
    - (éventuellement, testez et configurer l'éditeur de texte graphique "xed")
- 1.8 - Vérifiez avec `df -h`, `lsblk -f` et `mount` que le partitionnement et les points de montage correspondent à ce que vous avez fait.
- 1.9 - Au bureau, un collègue vous informe que vous aurez besoin d'une partition de type NTFS sur votre disque, pour pouvoir communiquer avec un OS de type Microsoft. Vous décidez alors d'ajuster le partitionnement de votre disque.
    - Relancez votre machine, de nouveau avec l'ISO dans le lecteur CD virtuel
    - Depuis la live CD, lancez le programme "Gparted"
    - Redimensionnez la partition correspondant à /home pour la réduire de 1 Go
    - Créez une nouvelle partition de type ntfs prenant le 1 Go maintenant libre
    - Validez les changements
    - Redémarrez le système
- De retour sur votre bureau, :
    - Vérifier qu'une nouvelle partition ntfs est effectivement présente via `lsblk -f`
    - Créez un dossier `windows` dans `/media/` puis montez manuellement la nouvelle partition sur `/media/windows`. (Vérifiez le résultat avec `lsblk` et `df -h`)
- 1.10 - Rendez ce montage automatique en modifiant `/etc/fstab` et en redémarrant le système. (Vérifiez le résultat avec `lsblk` et `df -h`)

### Exercices avancés

- Inspectez l'arbre des processus avec `ps -ef --forest` et identifiez le serveur graphique `Xorg`
- Si vous avez une clef USB, trouvez de quoi flasher l'ISO depuis Windows (par exemple, Etcher ou Unetbootin) puis tentez de démarrer votre machine physique sur la live USB (n'installez pas Linux Mint sur la machine physique !!)
- De retour dans la machine virtuelle, arrangez-vous pour affichez GRUB pendant le démarrage puis appuyez sur "e" pour modifier les instructions de démarrage. À la fin de la commande "linux", ajoutez `init=/bin/bash` puis poursuivez le démarrage. Que se passe-t-il ?


# 2 - Le gestionnaire de paquet (et les archives)

### Gestionnaire de paquet

- 1.11 Suite à l'installation de votre système, vous voulez vous assurer qu'il est à jour.
   - Lancez la commande `apt update`. Quels dépôts sont contactés pendant cette opération ?
   - À l'aide de `apt list --upgradable`, identifiez si `firefox`, `libreoffice`, `linux-firmware` et `apt` peuvent être mis à jour - et identifiez l'ancienne version et la nouvelle version.
   - Lancez la mise à jour avec `apt dist-upgrade`. Pendant le déroulement de la mise à jour, identifiez les trois parties clefs du déroulement : liste des tâches et validation par l'utilisateur, téléchargement des paquets, et installation/configuration.

- 1.12 - Cherchez avec `apt search` si le programme `sl` est disponible. (Utiliser `grep` pour vous simplifiez la tâche). À quoi sert ce programme ? Quelles sont ses dépendances ? (Vous pourrez vous aider de `apt show`)
- 1.13 - Même chose pour le programme `lolcat`
- 1.14 - Même chose pour le programme `nyancat` - mais cette fois, trouvez un moyen de télécharger le `.deb` directement depuis le site de debian qui référence les paquets, puis installez ce `.deb` avec `dpkg -i`.
- 1.15 - Parfois, il est nécessaire d'ajouter un nouveau dépôt pour installer un programme (parce qu'il n'est pas disponible, ou bien parce qu'il n'est pas entièrement à jour dans la distribution utilisée). Ici, nous prendrons l'exemple de `mongodb` où la version 4 n'est disponible que via un dépôt précis maintenu par les auteurs de mongodb.
    - Regarder avec `apt search` et `apt show` (et `grep` !) si le paquet `mongodb` est disponible et quelle est la version installable. 
    - Ajouter un nouveau fichier (par exemple `mongodb.list`) dans `/etc/apt/sources.list.d` avec une unique ligne : `deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse`
    - Faire `apt update`. Que se passe-t-il ? Quels serveurs votre machine a-t-elle essayer de contacter ? Pourquoi cela produit-il une erreur ?
    - Ajoutez la clef d'authentification des paquets avec `apt-key adv --keyerver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4`.
    - Refaire `apt update`. Est-ce que ça fonctionne ?
    - Regarder avec `apt search` et `apt show` (et `grep` !) si le paquet `mongodb-org` est disponible et quelle est la version installable.
    - Installer le paquet. Depuis où a-t-il été téléchargé ?
    - Désinstallez ce paquet (en purgeant les données / fichiers) et supprimez le `mongodb.list` puis refaites un `apt update` pour remettre à plat la liste des paquets disponibles.
- 1.16 - Regardez le contenu de `/var/cache/apt/archives`. À quoi ces fichiers correspondent-ils ? Trouvez deux méthodes pour nettoyer ces fichiers, l'une "brutale" avec `rm`, et l'autre "propre" avec `apt`.
- 1.17 - Utilisez `aptitude why` pour trouver la raison pour laquelle le paquet `libxcomposite1` est installé
- 1.18 - Utilisez `apt-rdepends` pour afficher la liste des dépendances de `libreoffice`.
- 1.19 - Identifiez l'utilité de la commande `apt moo`

### Gestion des archives

- 1.20 - Créez une archive (non-compressée !) de votre répertoire personnel avec `tar`.
- 1.21 - En utilisant `gzip`, produisez une version compressée de l'archive de la question précédente
- 1.22 - Recommencez mais produisant une version compressée directement
- 1.23 - En fouillant dans les options de `tar`, trouvez un moyen de lister le contenu de l'archive
- 1.24 - Créez un dossier `test_extract` dans `/tmp/`, déplacez l'archive dans ce dossier puis décompressez-là dedans.
- 1.25 - En reprenant le `.deb` du programme `nyancat` de la question 1.14, utilisez `ar` et `tar` pour décompresser le `.deb` jusqu'à trouver le fichier de controle debian, ainsi que l'executable contenu dans le paquet.
- 1.26 - Trouvez un ou des fichiers `.gz` dans `/var/log` (ou ailleurs ?) et cherchez comment combiner `cat` et `gzip` pour lire le contenu de ce fichier sans créer de nouveau fichier.

### Exercices avancés

- Investiguez les options de `apt-rdepends` et du programme `dot` pour générer un rendu en PNG du graphe de dépendance de `firefox`.
- Trouvez où télécharger le `.deb` du paquet `nyancat` depuis `ftp.debian.org`
- (Très avancé) Renseignez-vous sur `equivs` et créez un package virtuel `lolstuff` qui dépend de `sl`, `lolcat` et `nyancat`

