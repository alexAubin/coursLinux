# Feuille d'exercices


## 2. Prendre en main sa machine et le terminal

### 0. Création de la machine

- Installer Virtualbox
- Important une machine Debian Stretch ("appareil virtuel")

### 1. Démarrer et se logguer

- Observer le démarrage de la machine
- Se logger

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

- 3.1 - Rendez-vous dans /usr/bin et listez le contenu du dossier
- 3.2 - Y'a-t-il des fichiers cachés dans votre répertoire personnel ?
- 3.3 - Quand a été modifié le fichier /etc/shadow ?
- 3.4 - Identifiez à quoi sert l'option `-h` de la commande `ls` via son `man`.
- 3.5 - Identifiez ce que fait la commande `sleep` via son `man`.
- 3.6 - Lancer `sleep 30` et arrêter l'execution de la commande avant qu'elle ne se termine.
- 3.7 - Lister successivement et le plus rapidement possible le contenu des dossier `/usr`, `/usr/share`, `/usr/share/man` et `/usr/share/man/man1` grâce à [Tab] et ↑.
- 3.8 - Se renseigner sur ce que font `date` et `cal`
- 3.9 - Afficher le calendrier pour l'année 2019, puis juste le mois de Février 2019


### 4. Le système de fichier 

- 4.1 - En utilisant `mkdir` et `touch`, créez dans votre répertoire personnel l'arborescence suivante :

```
documents/
├── notes_a_propos_des_commandes/
│   ├── ls.txt
│   ├── cd.txt
│   └── pwd.txt
├── img/
│   ├── pikachu.jpg
│   └── carapuce.jpg
└── coursLinux.pdf
```

- 4.2 - Remplissez `ls.txt`, `cd.txt` et `pwd.txt` avec du texte en utilisant `nano` (par exemple, résumez l'utilité de la commande et ses options / cas d'usage)

- 4.3 - Vérifiez que le contenu de ces fichiers a bien été modifié avec `cat`.
- 4.4 - Affichez le contenu du fichier `/etc/os-release`
- 4.4 - Aller dans `~/documents/notes_a_propos_des_commandes` puis, *en utilisant uniquement des chemins relatifs* et en vous aidant de la touche [Tab], déplacez-vous successivement vers :
    - `~/documents/img`
    - `/usr/share/doc/`
    - `~/.nano`
    - `~/documents/img`
- 4.5 - Affichez le contenu de `/etc/motd` et `/etc/login.defs`
- 4.6 - En utilisant `less`, checher `LOGIN_TIMEOUT` dans le fichier `/etc/login.defs`. Même chose, mais cette fois en utilisant `nano`.
- 4.7 - Combien de ligne fait le fichier `/etc/login.defs` ?
- 4.8 - Créez le fichier `dracaufeu.jpg` dans le dossier `~/documents/notes_a_propos_des_commandes/`... Vous réalisez ensuite que vous auriez voulu mettre ce fichier dans `~/documents/img` ! Utilisez alors la commande `mv` pour déplacer `dracaufeu.jpg` vers le bon dossier.
- 4.9 - Renommez `~/documents/img` en `~/documents/pokemons`
- 4.10 - Créez un nouveau dossier `~/mybins` et copiez dedans les fichier `/bin/ls` et `/bin/pwd`.
- 4.11 - Créez un dossier `~/bkp/` et créer une copie de `~/documents/notes_a_propos_des_commandes` qui s'apelle `~/bkp/cmd_bkp`
- 4.12 - Supprimez `~/bkp/cmd_bkp/pwd.txt`
- 4.13 - Supprimez tout le dossier `~/bkp/` récursivement
- 4.14 - Tentez de supprimer `/etc/passwd` en tant que `padawan`


### 5. Utilisateurs et groupes

- 5.1 - Ouvrir un shell `root` avec `sudo`, `su`, ou via un autre `tty`
- 5.2 - Créez un utilisateur `r2d2`
- 5.3 - Créez un groupe `droid`
- 5.4 - Ajoutez `r2d2` au groupe `droid`
- 5.5 - À l'aide de `su`, lancez un shell en tant que `r2d2` et regarder le résultat de `whoami`, `id` et `groups`
- 5.6 - Définir un mot de passe avec `passwd`
- 5.7 - Ouvrir plusieurs tty et se logger avec différents utilisateurs, puis observer ce que `who` retourne
- 5.8 - Vérifiez que les infos de `r2d2` sont bien dans `/etc/passwd` et `/etc/shadow`
- 5.9 - Que se passe-t-il si vous définissez `/bin/false` comme shell par défaut pour `r2d2` ?
- 5.10 - En inspectant le contenu de `/etc/sudoers`, pouvez-vous donnez le droit à `r2d2` d'utiliser `sudo` ?

### 6. Permissions

- 6.1 - Créez un fichier `xwing.conf` que seul vous et votre groupe pouvez lire
- 6.2 - Créez un fichier `private` et supprimer toutes les permissions dessus
- 6.3 - Ajoutez successivement à `private` le droit de lecture au propriétaire, le droit d'écriture au groupe et au proprietaire, et les droits d'execution pour tout le monde.
- 6.4 - Resupprimez toutes les permissions de `private`
- 6.5 - Remettez les mêmes permissions qu'avant mais avec une seule commande
- 6.6 - Modifier les permissions de votre répertoire personnel pour que seul vous ayez le droit d'écriture et de traverse (x) dessus
- 6.7 - Interdisez à tous les "autres" utilisateurs de fouiller et modifier les fichier dans `~/documents`, avec une seule commande qui aura un effet récursif
- 6.8 - Créez un répertoire personnel pour `r2d2`
- 6.9 - Définir `r2d2` comme proprietaire de son dossier personnel + s'assurer que les permissions lui permettent (à lui et à lui seul) de lire, ecrire et entrer dans son repertoire.
- 6.10 - Créez un fichier `droid.conf` dans son dossier personnel, le définir comme propriétaire, et définir le groupe comme 'droid'.
- 6.11 - Créez des fichier `beep.wav`, `boop.wav` et `blop.wav` que seul `r2d2` peut executer.
- 6.12 - Êtes-vous capable de créer un dossier qui contient des fichiers qu'il est possible de lire, mais pas de lister ?
- 6.13 - En tant qu'utilisateur `padawan`, arrivez-vous à donner un de vos fichier à `r2d2` ?

### 7. Processus

- 7.1 - Lancer `sleep 30`, puis mettre la commande en arrière-plan. Vérifier avec `jobs` qu'elle continue de s'executer, et qu'elle finie bien par se terminer.
- 7.2 - Même chose, mais en remettant la commande en avant-plan avec qu'elle ne se termine.
- 7.3 - Lancer `sleep 30` directement en arrière plan (avec `&`) puis tuez le processus avant qu'il ne se termine
- 7.4 - Lancer encore `sleep 30` dans un terminal, puis regarder depuis un autre terminal avec une commande comme `ps` que le processus est bien là
- 7.5 - Identifiez ainsi quel processus (son parent) corresponds au shell qui a lancé le `sleep 30`
- 7.6 - Connaissant le PID de ce shell, tenter de tuer le shell gentillement (ou brutalement si il résiste)
- 7.7 - Identifiez avec `top` le processus consommant en ce moment le plus de CPU, et celui consommant le plus de mémoire
- 7.8 - Lancer la commande `openssl speed -multi 4` - puis refaite le test
- 7.9 - Tout en laissant `openssl speed -multi 4` s'executer, lancer la commande `ls /bin/` avec la priorité la plus faible possible. Que se passe-t-il ?
- 7.10 - Réduisez drastiquement "à chaud" la priorité de la commande `openssl speed -multi 4` en train de s'executer. Si vous relancer `ls /bin/` toujours avec la priorité la plus basse, comment la situation évolue-t-elle ?
- 7.11 - Comment pouvez-vous tuer d'un seul coup tous les processus `openssl` ?
- 7.12 - Lancez une session screen puis une commande longue dans cette session, comme par exemple `sleep 30`. Détachez la session puis ré-attachez-la depuis un autre tty.
- 7.13 - Dans une autre console, identifiez via `ps` le PID de la session screen et tentez de tuer ce processus.

### 8. Personnaliser son environnement

- 8.1 - Personnaliser l'apparence de votre invite de commande (syntaxe, couleurs) en modifiant la variable PS1.
- 8.2 - Ajouter la personnalisation de l'invite à votre `.bashrc` et propagez ces changements sur vos shells ouverts.
- 8.3 - Ajouter aussi un message de bienvenue comme "May the source be with you" qui s'affichera à chaque ouverture d'un shell.
- 8.4 - Changer le .bashrc de root pour que son invite de commande soit en rouge !
- 8.5 - S'assurer que vous disposez de l'alias `ll` (pour `ls -l`), et que `--color=auto` est activé implicitement lorsque vous utilisez `ls`.
- 8.6 - Créer des alias `suls` et `sucat` qui permettent de lister les fichiers d'un dossier, ou d'afficher le contenu d'un fichier en activant automatiquement `sudo`. Tester ces alias en tapant `suls /root` et `sucat /etc/shadow` en tant que padawan.
- 8.7 - Créer un alias `r2d2` qui permet d'ouvrir un shell en tant que `r2d2` avec `sudo` et `su`.
- 8.8 - Se renseigner sur `LS_COLORS` et personnaliser cette variable.
- 8.9 - En utilisant `echo`, comment faire pour faire en sorte que la commande 'ls' retourne systématiquement 'J'ai pas envie' au lieu de son comportement normal ?


