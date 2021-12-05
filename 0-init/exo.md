# Le terminal et l'écosystème Linux

### 0. Création de la machine

- Installer Virtualbox, puis créer une nouvelle machine virtuelle
   - choisissez comme type Linux / Other-Linux (64 bit)
   - 2048 Mo de RAM devraient suffir
   - au moment de spécifier le disque dur virtuel, utiliser l'image de disque provenant de OSboxes.org

### 1. Démarrer et se logguer

- Démarrer la machine et *observer* son démarrage
- L'user par défaut est `osboxes.org` et le mot de passe `osboxes.org`. Malheureusement, le clavier est en Quwerty par défaut, et le mot de passe deviens (en azerty : `osboxes:org`
- Une fois loggué, configurez la langue et la disposition du clavier en Francais/Azerty. Vous trouverez cette configuration dans le "Menu démarrer" > Keyboads, puis '+' pour ajouter la disposition de clavier. Enfin, supprimez la disposition Qwerty avec le '-'.
- Ajoutez un nouvel utilisateur au système nommé `padawan`, avec le mot de passe de votre choix, puis re-logguez vous avec cet utilisateur.
- Pour que l'écran de la machine virtuelle (VM) s'adapte automatiquement et joliment à la taille de l'écran, il vous faut utiliser le menu "Périphériques" (tout en haut de l'écran), puis, en bas du menu, "Insérer le CD des add-ons invités". Ensuite, accepter d'executer le CD dans Linux Mint. Un terminal s'ouvre automatiquement pour installer des logiciels. Une fois terminé, redémarrer la machine, et l'écran devrait s'adapter automatiquement à la taille de la fenêtre.

### 2. Premier contact avec la ligne de commande commandes

- Changer le mot de passe en tapant `passwd` puis *Entrée* et suivre les instructions
- Taper `pwd` puis *Entrée* et observer
- Taper `ls` puis *Entrée* et observer
- Taper `cd /var` puis *Entrée* et observer
- Taper `pwd` puis *Entrée* et observer
- Taper `ls` puis *Entrée* et observer
- Taper `ls -l` puis *Entrée* et observer
- Taper `echo 'Je suis dans la matrice'` puis *Entrée* et observer
 
### 3. La ligne de commande

- **3.1** - Rendez-vous dans `/usr/bin` et listez le contenu du dossier
- **3.2** - Y'a-t-il des fichiers cachés dans votre répertoire personnel ?
- **3.3** - Quand a été modifié le fichier `/etc/shadow` ?
- **3.4** - Identifiez à quoi sert l'option `-h` de la commande `ls` via son `man`.
- **3.5** - Cherchez une option de `ls` qui permet de trier les fichiers par date de modification
- **3.6** - Identifiez ce que fait la commande `sleep` via son `man`.
- **3.7** - Lancer `sleep 30` et arrêter l'execution de la commande avant qu'elle ne se termine.
- **3.8** - Pour vous entraîner à utiliser [Tab] et ↑, tentez le plus rapidement possible et en utilisant le moins de touches possible de lister successivement le contenu des dossiers `/usr`, `/usr/share`, `/usr/share/man` et `/usr/share/man/man1`.
- 3.9 - Se renseigner sur ce que font `date` et `cal`
- 3.10 - Afficher le calendrier pour l'année 2022, puis juste le mois de Février 2022
- **3.11** - Se renseigner sur ce que fait la commande `free`, et interpreter la sortie de `free -h`
- **3.12** - Se renseigner sur ce que fait la commande `ping` et interpreter la sortie de `ping 8.8.8.8`

### 4. Le système de fichier 

- **4.1** - En utilisant `mkdir` et `touch`, créez dans votre répertoire personnel l'arborescence suivante :

```bash
~/
├── Documents/
    ├── formation_linux/
    │   ├── slides_1_les_bases.html
    │   └── exo_1_les_bases.pdf
    └── mon_pokedex/
        ├── index.html
        ├── all_pokemons.txt
        ├── mon_equipe_de_pokemons.csv
        └── assets/
            ├── css/
            │   └── pokedex.css
            ├── fonts/
            │   └── pokefont.ttf
            └── img/
                ├── logo.png
                ├── pikachu.jpg
                └── carapuce.jpg
```

- **4.2** - Téléchargez la liste de tous les pokémons connus (`all_pokemons.txt`) depuis le serveur du formateur à l'aide de `wget`.
- **4.3** - À l'aide de `nano`, remplissez `mon_pokedex/mon_equipe_de_pokemons.csv` avec quelque chose comme:

```
Pokemon;Niveau
bulbizarre;17
rattata;8
roucoups;15
```

Vérifiez que le contenu a bien été pris en compte en l'affichant avec `cat`.

- **4.4** - Aller dans `~/Documents/mon_pokedex/assets/` puis, **en utilisant uniquement des chemins relatifs** et en vous aidant de la touche [Tab], déplacez-vous successivement vers :
    - `~/Documents/mon_pokedex/assets/img`
    - `~/Documents/formation_linux`
    - `~/.local/` (ou `~/.config/` si `~/.local/` n'existe pas)
    - `~/Documents/mon_pokedex/assets/fonts`
    - `/usr/share/doc/`
    - `~/`
- **4.5** - Créez un fichier `dracaufeu.jpg` dans `~/Documents/formation_linux` ... Vous réalisez ensuite que vous auriez voulu mettre ce fichier dans `~/Documents/mon_pokedex/assets/img` ! Utilisez alors la commande `mv` pour déplacer le fichier vers le bon dossier.
- **4.6** - Renommez le dossier `mon_pokedex/` en `ma_collection_de_pokemons/`
- **4.7** - Supprimez le fichier `carapuce.jpg` dans `~/Documents/mon_pokedex/assets/img` **en restant là où vous êtes actuellement, i.e. sans utiliser `cd`**
- **4.8** - Créez un dossier `~/sauvegardes` et dedans, créer un dossier `collection_bkp` qui sera une copie récursive de `~/Documents/ma_collection_de_pokemons`
- **4.9** - Supprimez tout le dossier `~/sauvegardes` récursivement

- **4.10** - Depuis là où vous êtes (i.e. sans utiliser `cd` !):
    - affichez le contenu de `/etc/os-release` : devinez-vous à quoi correspondent ces informations ?
    - affichez le contenu de `/etc/hostname` : à quoi correspond cette information ?
    - affichez le contenu de `/etc/timezone` : à quoi correspond cette information ?
    - affichez le contenu de `/etc/default/locale` : à quoi correspond cette information ?

- **4.11** - Regardez le contenu de `/etc/nanorc` : 
    - à quoi correspond ce fichier ?
    - en utilisant `less`, cherchez toutes les occurences du mot `set`.
    - même chose mais cette fois en ouvrant le fichier avec `nano` (il existe un raccourci clavier pour chercher un mot dans `nano`)
- **4.12** - Utilisez une commande pour compter le nombre de ligne du fichier `/etc/nanorc` 
- **4.13** - Copiez le fichier `/etc/nanorc` dans `~/.nanorc`. Éditez ensuite cette copie pour décommenter la ligne `# set linenumbers` (c'est à dire enlever le `#` devant la ligne pour activer l'option `linenumbers`). Qu'avons-nous fait avec cette manipulation ? Pourquoi avoir copié le fichier dans notre répertoire personnel pour faire cela ?

### 5. Utilisateurs, groupes et shells

- **5.1** - Ouvrir un premier terminal en tant que `padawan`
- **5.2** - Ouvrir un deuxième terminal. Dedans, ouvrir un sous-shell en `root` à l'aide des commandes `sudo` et/ou `su`.
- **5.3** - Dans votre deuxième terminal (en `root`)
    - créez un utilisateur `r2d2`
    - définissez un mot de passe pour l'utilisateur `r2d2` à l'aide de la commande `passwd`
    - créez un groupe `droid`
    - ajoutez `r2d2` au groupe `droid`
    - constatez que les infos de `r2d2` et du groupe `droid` sont bien dans `/etc/passwd`, `/etc/shadow` et `/etc/group`
- **5.4** - Ouvrir un troisième terminal. Dedans, ouvrir un sous-shell en tant que `r2d2` à l'aide des commandes `sudo` et/ou `su`. 
    - l'invite de commande obtenue est différente de celle de `r2d2` et `root`. Pourquoi ? (On pourra comparer le résultat de la commande `echo $SHELL`)
    - comment peut-on procéder pour changer le shell par défaut de `r2d2` ? (Indice: regarder `/etc/passwd`, ou bien la commande `chsh`)
    - regardez le résultat des commandes `whoami`, `id` et `groups` et comparez à ce que vous obtenez pour ces commandes dans le premier terminal (en tant que `padawan`)
- **5.5** - Inspectez le contenu de `/etc/sudoers`:
    - en lisant les commentaires du fichier, chercher comment faire pour donner le droit à `r2d2` d'utiliser `sudo`
    - (après avoir fait la manip, n'oubliez pas de relancer le terminal/shell dans lequel vous êtes pour propager le changement!)
    - depuis un shell en tant que `r2d2`, validez que vous êtes en mesure de faire des commandes avec `sudo` (Par exemple: `sudo ls -la /root/`).
- 5.6 - Constatez que les commandes executées avec `sudo` sont logguées dans le ficher `/var/log/auth.log` (on pourra utiliser `tail` pour afficher seulement les dernières lignes du fichier)

### 6. Permissions

- **6.1** - Créez un fichier `xwing.conf` que seul vous et votre groupe pouvez lire
- **6.2** - Créez un fichier `private` et supprimer toutes les permissions dessus
- **6.3** - Ajoutez successivement à `private` le droit de lecture au propriétaire, le droit d'écriture au groupe et au proprietaire, et les droits d'execution pour tout le monde.
- **6.4** - Resupprimez toutes les permissions de `private`
- **6.5** - Remettez les mêmes permissions qu'avant mais avec une seule commande en utilisant la notation octale
- 6.6 - Modifier les permissions de votre répertoire personnel pour que seul vous ayez le droit d'écriture et de traverse (x) dessus
- **6.7** - Interdisez à tous les "autres" utilisateurs de fouiller et modifier les fichier dans `~/documents`, avec une seule commande qui aura un effet récursif
- **6.8** - Créez un répertoire personnel pour `r2d2`. Définir `r2d2` comme proprietaire de son dossier personnel + s'assurer que les permissions lui permettent (à lui et à lui seul) de lire, ecrire et entrer dans son repertoire.
- 6.9 - Créez un fichier `droid.conf` dans son dossier personnel, le définir comme propriétaire, et définir le groupe comme 'droid'.
- 6.10 - Créez des fichier `beep.wav`, `boop.wav` et `blop.wav` que seul `r2d2` peut executer.
- 6.11 - Êtes-vous capable de créer un dossier qui contient des fichiers qu'il est possible de lire, mais pas de lister ?
- 6.12 - En tant qu'utilisateur `padawan`, arrivez-vous à donner un de vos fichier à `r2d2` ?
- 6.13 - (Avancé) Utilisez `setfacl` pour autoriser le groupe `droid` à lister et rentrer dans votre home. Confirmez l'effet attendu, d'une part avec `ls -l` et `getfacl`, et d'autre part depuis un shell en étant connecté en tant que `r2d2`
- 6.14 - (Avancé) Même chose, mais cette fois-ci donnez le droit de list et rentrer dans `/home/r2d2` à l'user(!) `padawan`.

### 7. Processus

- **7.0** - Utilisez `ps -ef` ou `top` et trouvez un processus qui ne tourne ni en tant que `root`, ni en tant que `padawan`
- **7.1** - Lancer `sleep 30`, puis mettre la commande en arrière-plan. Vérifier avec `jobs` qu'elle continue de s'executer, et qu'elle finie bien par se terminer.
- **7.2** - Même chose, mais en remettant la commande en avant-plan avec qu'elle ne se termine.
- **7.3** - Lancer `sleep 30` directement en arrière plan (avec `&`) puis tuez le processus avant qu'il ne se termine
- **7.4** - Lancer encore `sleep 30` dans un terminal, puis regarder depuis un autre terminal avec une commande comme `ps` que le processus est bien là
- **7.5** - Identifiez ainsi quel processus (son parent) corresponds au shell qui a lancé le `sleep 30`
- **7.6** - Connaissant le PID de ce shell, tenter de tuer le shell gentillement (ou brutalement si il résiste)
- **7.7** - Lancez une session screen puis une commande longue dans cette session, comme par exemple `sleep 30`. Détachez la session puis ré-attachez-la depuis un autre tty.
- **7.8** - Dans une autre console, identifiez via `ps` le PID de la session screen et tentez de tuer ce processus.
- 7.9 - Identifiez avec `top` le processus consommant en ce moment le plus de CPU, et celui consommant le plus de mémoire
- 7.10 - Lancer la commande `openssl speed -multi 4` - puis refaite le test
- 7.11 - Tout en laissant `openssl speed -multi 4` s'executer, lancer la commande `ls /bin/` avec la priorité la plus faible possible. Que se passe-t-il ?
- 7.12 - Réduisez drastiquement "à chaud" la priorité de la commande `openssl speed -multi 4` en train de s'executer. Si vous relancer `ls /bin/` toujours avec la priorité la plus basse, comment la situation évolue-t-elle ?
- 7.13 - Comment pouvez-vous tuer d'un seul coup tous les processus `openssl` ?

