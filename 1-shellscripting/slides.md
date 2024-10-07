title: Automatiser l'administration Unix/Linux avec les scripts Shell 
class: animation-fade
layout: true

---

class: impact

# Automatiser l'administration 
# Unix/Linux 
# avec les scripts Shell 

*Become a Bash jedi in three days!*

.center[
![](img/gnulinux.png)
]

TODO/FIXME : bash icon?

---

# À propos de moi

.col-12[
.col-4[
.center[
![](img/me.jpg)
]
]

.col-8[.center[
<br>
<br>
`https://github.com/alexAubin`
<br>
<br>
`alex.aubin@mailoo.org`
<br>
<br>
]]
]

.col-4[.center[
Ingénieur/Physicien

![](img/cern.png)
</br>
![](img/particles.jpg)
]]

.col-4[.center[
Dev / adminsys / ...

![](img/yunohost.png)
![](img/arn.png)
![](img/odoo.png)
]]

.col-4[.center[
Formateur

![](img/python_arduino_linux.png)
]]

---

# À propos de vous

---

# Organisation

## Horaires

- 9h00 -> 12h30 <small>(pause de 10 min autour de 10h30)</small>
- Repas
- 13h30 -> 17h00 <small>(pause de 10 min autour de 15h30)</small>

.center[
(soit 7h00 de formation / jour !)
]

## Signatures de présence

## Évaluations de la formation

---


# Plan de la formation

- Jour 1 ?
    - 0 - "Rappels"
    - 1 - Le(s) shell(s)
    - 2 - Enchainement de commandes et redirections
    - 3 - Pipes (`|`), filtres, boîte à outils
    - 4 - Écrire et executer des scripts
- Jour 2 ?
    - 5 - Manipuler des variables
        - TODO
        - arithmétique, $(( )), +=
        - manip pur bash / valeur par défaut / replace / ...
    - 6 - Scripts interactifs / paramétrables
    - 7 - Conditions
        - TODO
        - case
        - discussion && / ||
        - "test" vs [ vs [[
    - 8 - Fonctions
    - 9 - Boucles
        - TODO
        - until
        - itérer sur un fichier
        - xargs?
    TODO exercice allumettes
- Jour 3 ?
    - 10 - Bonnes pratiques
        - TODO
    - 11 - Expressions régulières (avec grep et sed)
        - TODO exercice
    - 12 - Tâches automatiques (avec cron et at)
        - TODO rework exercice
    - 13 - Misc / Astuces / syntaxes avancées
        - TODO
        - Programmation parallèle
        - eval
        - tableaux
        - manip bash cheloues style ${foo:-}


---

# Méthode de travail

- Alternance théorie / pratique
- Publication du contenu au fur et à mesure
    - sur **https://aleks.internetlib.re/docs/formationLinux**
- Travail dans une machine virtuelle
- Setup avec Guacamole pour les stagiaires à distance

# Objectifs

- Vous fournir des bases solides via la pratique
- Vous transmettre une forme d'enthousiasme !

---

# Disclaimers

- C'est une formation d'informatique technique
- L'informatique technique, c'est compliqué
- Le brute force ne marche pas, il faut être précis / rigoureux...
- Soyez **patient, méthodique, attentifs** !
- **Ne laissez pas l'écran vous aspirer** !

## On est là pour apprendre

- Réussir les exo importe peu, il faut **comprendre ce que vous faites** !
- Apprendre plus que de la théorie (posture, savoir se dépatouiller...)
- Prenez le temps de vous tromper (et de comprendre pourquoi)

## **N'hésitez pas à poser vos questions !**


---

.center[
![](img/highwaytoshell.png)
]

---

class: impact

# 0 - Rappels (?)

---

# 0 - Rappels (?)

## (1/4) La ligne de commande

- `cd` pour changer de dossier courant
- `ls` / `ls -l` / `ll` pour lister les fichiers
    - les fichiers commençant par `.` ne sont pas affichés par défaut
- Les commandes ont des options courtes (par ex. `-f`) ou longues (par ex. `--fullscreen`)
- Obtenir de l'aide : `cmd --help` (ou `-h`), ou `man cmd`
- Auto-complétion avec `Tab`ulation
- Flèches haut/bas pour retrouver les commandes précédentes

----

- `Ctrl+R` pour chercher dans les commandes précédentes, `history` pour afficher tout l'historique
- `Ctrl+C` pour annuler la commande en cours
- `Ctrl+A`/`E` pour aller au début / à la fin, `Ctrl+U` pour effacer tout ce qui est à gauche
- Copier-coller avec sélection et clic-du-milieu, ou bien `Ctrl+Insert` et `Shift+Insert`

---

# 0 - Rappels (?)

## (2/4) Manipuler des fichiers

- chemin relatif vs chemin absolu
    - en particulier, pas besoin de systématiquement se déplacer avec `cd` pour manipuler un fichier
- **Créer** / **éditer** des fichiers textes : `nano` (ou `vim`)
- **Fichiers**: déplacer : `mv`, copier : `cp`, supprimer : `rm`
- **Dossiers**: créer : `mkdir`, déplacer : `mv`, copier : `cp -r`, supprimer : `rm -r`
- Récupérer des fichiers depuis internet (via une URL) `wget <url>` ou `curl <url>`

---

# 0 - Rappels (?)

## (3/4) Utilisateurs et permissions

- `root` est dieu sur la machine
- `sudo` permet d'exécuter ponctuellement une commande en tant que `root` (si on est *sudoers*)
    - `sudo su` ou `sudo -i` pour ouvrir un shell interactif
- `groups` pour lister les groupes dans lesquelles nous sommes
- Les users sont référencés dans dans `/etc/passwd`

----

- Les permissions et propriétaires des fichiers sont montrés dans le retour de `ls -l` 
- `chmod` : changer les permissions
- `chown` : changer le propriétaire / groupe
- `namei -l /chemin/du/fichier` pour inspecter les permissions tout le long du chemin

---

# 0 - Rappels (?)

## (4/4) Les processus

- Différence entre programme et processus
- Notion de PID, PPID, de propriétaire et permission
- `ps -ef --forest` pour voir l'arborescence des process en cours
- `top`, `htop` pour voir "dynamiquement" les process en cours (notamment conso de CPU/RAM)
- `cmd &` pour lancer une commande en arrière-plan <small>(ou aussi : `Ctrl+Z` puis `bg` si on a oublié de mettre le `&`)</small>
- `screen` / `tmux` pour lancer des commandes sans être lié à un terminal particulier 
- `kill` / `kill -9` pour tuer un process via son PID

---

class: impact

# 1 - Le(s) shell(s)

---

# 1 - Le(s) shell(s)

### Origine historique : le tty (teletype)

.center[
![](img/tty1.jpg)
![](img/tty2.jpg)
]

---

# 1 - Le(s) shell(s)

### Le terminal

Dans le temps, il s'agissait d'une machine sans interface graphique, similaire à un minitel qui permettait d'interagir avec le "vrai" ordinateur (mainframe) à distance.

De nos jours, par abus de language un terminal est en fait un **émulateur** de terminal, c'est-à-dire un programme qui émule la même fonctionnalité. (La distinction terminal/mainframe a disparu)

### Le shell

Il s'agit du programme qui gère l'invite de commande et l'execution des commandes tapées.

Classiquement, il s'agit de `bash`. Il existe d'autres shell comme `sh`, `zsh`, `fish`, ...

Lorsque l'on programme dans certains languages de scripting, on parle aussi de shell `python`, `perl`, `ruby`, `javascript`, ...

Un shell que vous utilisez peut potentiellement être situé sur une autre machine que celle devant laquelle vous êtes !

---

# 1 - Le(s) shell(s)

### Les différents shells

- `bash` ("Bourne-Again" shell) : c'est le plus classique, souvent utilisé aussi pour créer des scripts
- `sh` (aussi appellé `dash`) : c'est l'ancêtre de `bash`, plus rudimentaire (pas d'historique, pas d'autocomplétion)
- `zsh` : un shell plus puissant que `bash` (meilleur autocomplétion, partage d'historique entre les shells ouverts, correction des typos, ..)
- `fish` : un shell encore plus moderne et convivial
- et d'autres moins courants / historiques : `ash`, `csh`, `ksh`, ...

---

# 1 - Le(s) shell(s)

- Le shell qu'on utilise par défaut est configuré dans `/etc/passwd`
- On peut le changer avec `chsh`
- On peut aussi simplement lancer manuelle un shell en lançant la commande : `bash`, `zsh`, `python`, ...

----

- Dans certains contextes on utilise un shell qui n'est pas la machine devant laquelle on est:
    - Lancer une session `ssh`
    - Ouvrir un shell dans un docker ou un LXC

---

# 1 - Le(s) shell(s)

### Personnaliser le shell bash

TODO / FIXME

- /etc/.profile, ~/.bashrc
- alias
- PS1
- variables d'env

---

# 1 - Le(s) shell(s)

### Caractères spéciaux, expansions en bash

TODO / FIXME

- `*`
- `{foo,bar}`
- `$foo`
- simple / double quotes
- echap




---

class: impact

# 2 - Redirections, assemblages

---

# 2 - Redirections, assemblages

## Schema fonctionnel d'une commande

- Une commande est une boîte avec des entrées / sorties
- et un code de retour (`$?`)
   - 0 : tout s'est bien passé
   - 1 (ou toute valeur différente de 0) : problème !

.center[
![](img/commandbox.png)
]

---

# 2 - Redirections, assemblages

## Entrées / sorties

.center[
![](img/commandbox.png)
]

- **arguments** : donnés lors du lancement de la commande (ex: `/usr/` dans `ls /usr/`)
- **stdin** : flux d'entrée (typ. viens du clavier)
- **stdout** : flux de sortie (typ. vers le terminal)
- **stderr** : flux d'erreur (typ. vers le terminal aussi !)

---

# 2 - Redirections, assemblages

## Code de retour

```bash
$ ls /toto
ls: cannot access '/toto': No such file or directory
$ echo $?
2
```

---

# 2 - Redirections, assemblages

## Rediriger les entrées/sorties (1/3)

- `cmd > fichier` : renvoie stdout vers un fichier (le fichier sera d'abord écrasé !)
- `cmd >> fichier ` : ajoute stdout à la suite du fichier
- `cmd < fichier` : utiliser 'fichier' comme stdin pour la commande
- `cmd <<< "chaine"` : utiliser 'chaine" comme stdin pour la commande

Exemples

```bash
ls -la ~/ > tous_mes_fichiers.txt  # Sauvegarde la liste de tous les fichiers dans le home
echo "manger" >> todo.txt          # Ajoute "manger" a la liste des choses à faire
wc <<< "une grande phrase"           # Compte le nomde de mot d'une chaine
```

---

# 2 - Redirections, assemblages

## Rediriger les entrées/sorties (2/3)

- `commande 2> fichier` : renvoie stderr vers un fichier (le fichier sera d'abord écrasé !)
- `commande 2>&1` : renvoie stderr vers stdout !
- `commande &> fichier` : renvoie stderr *et* stdout vers un fichier (le fichier sera d'abord écrasé !)

Exemples :

```bash
ls /* 2> errors  # Sauvegarde les erreurs dans 'errors'
ls /* 2>&1 > log # Redirige les erreurs vers stdout (la console) et stdout vers 'log'
ls /* > log 2>&1 # Redirige tout vers 'log' !
ls /* &> log     # Redirige tout vers 'log' !
```

---

# 2 - Redirections, assemblages

## Rediriger les entrées/sorties (3/3)

Fichiers speciaux :
- `/dev/null` : puit sans fond (trou noir)
- `/dev/urandom` : generateur aleatoire (trou blanc)

.center[
![](img/bottomlesspit.png)
]

---

# 2 - Redirections, assemblages

## Rediriger les entrées/sorties (3/3)

Fichiers speciaux :
- `/dev/null` : puit sans fond (trou noir)
- `/dev/urandom` : generateur aleatoire (trou blanc)

```bash
ls /* 2> /dev/null           # Ignore stderr
mv ./todo.txt /dev/null      # Façon originale de supprimer un fichier !
head -c 5 < /dev/urandom     # Affiche 5 caractères de /dev/urandom
cat /dev/urandom > /dev/null # Injecte de l'aleatoire dans le puit sans fond
```

---

# 2 - Redirections, assemblages

## Assembler des commandes

Executer plusieurs commandes à la suite :

- `cmd1; cmd2` : execute `cmd1` puis `cmd2`
- `cmd1 && cmd2` : execute `cmd1` puis `cmd2` mais seulement si `cmd1` reussie !
- `cmd1 || cmd2` : execute `cmd1` puis `cmd2` mais seulement si `cmd1` a échoué
- `cmd1 && { cmd2; cmd3; }` : "groupe" `cmd2` et `cmd3` ensemble (attention à la syntaxe !!)

Que fait `cmd1 && cmd2 || cmd3` ?

---

class: impact

# 3 - Pipes et boîte à outils

---

# 3 - Pipes et boîte à outils

## Pipes ! (1/3)

- `cmd1 | cmd2` permet d'assembler des commandes de sorte à ce que le `stdout` de `cmd1` devienne le `stdin` de `cmd2` !

Exemple : `cat /etc/login.defs | head -n 3`

.center[
![](img/pipe.png)
]

- (Attention, par défaut `stderr` n'est pas affecté par les pipes !)

---

# 3 - Pipes et boîte à outils

## Pipes ! (2/3)

Lorsqu'on utilise des pipes, c'est generalement pour enchaîner des opérations comme :
- générer ou récupérer des données
- filtrer ces données
- modifier ces données à la volée

Sous Linux : tout est fichier / tout est flux de texte

---

# 3 - Pipes et boîte à outils

## Pipes ! (3/3)

Precisions techniques
- La transmission d'une commande à l'autre se fait "en temps réel". La première commande n'a pas besoin d'être terminée pour que la deuxieme commence à travailler.
- Si la deuxieme commande a terminée, la première *peut* être terminée prématurément (SIGPIPE).
    - C'est le cas par exemple pour `cat tres_gros_fichier | head -n 3`

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `tee`

`tee` permet de rediriger `stdout` vers un fichier tout en l'affichant quand meme dans la console

```bash
tree ~/documents | tee arbo_docs.txt  # Affiche et enregistre l'arborescence de ~/documents
openssl speed | tee -a tests.log      # Affiche et ajoute la sortie de openssl à la suite de tests.log
```

(Note à propos de `commande | sudo tee fichier`)

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `grep` (1/3)

`grep` permet de trouver des lignes qui contiennent un mot clef (ou plus generalement, une expression)

```bash
$ ls -l | grep r2d2
-rw-r--r--  1 alex alex        0 Oct  2 20:31 r2d2.conf
-rw-r--r--  1 r2d2 alex     1219 Jan  6  2018 zblorf.scd
```

```bash
$ cat /etc/login.defs | grep TIMEOUT
LOGIN_TIMEOUT		60
```

(on aurait aussi pu simplement faire : `grep TIMEOUT /etc/login.defs`)

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `grep` (2/3)

Une option utile (parmis d'autres) : `-v` permet d'inverser le filtre

```bash
$ ls -l | grep -v "alex alex"
total 158376
d---rwxr-x  2 alex droid    4096 Oct  2 15:48 droidplace
-rw-r--r--  1 r2d2 alex     1219 Jan  6  2018 zblorf.scd
```

On peut créer un "ou" avec : `r2d2\|c3p0`

```bash
$ ps -ef | grep "alex\|r2d2"
# Affiche seulement les lignes contenant alex ou r2d2
```

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `grep` (3/3)

On peut faire référence à des débuts ou fin de ligne avec `^` et `$` :

```bash
$ cat /etc/os-release | grep "^ID"
ID=manjaro

$ ps -ef | grep "bash$"
alex      5411   956  0 Oct02 pts/13   00:00:00 -bash
alex      5794   956  0 Oct02 pts/14   00:00:00 -bash
alex      6164   956  0 Oct02 pts/15   00:00:00 -bash
root      6222  6218  0 Oct02 pts/15   00:00:00 bash
```

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `tr`

`tr` ('translate') traduit des caractères d'un ensemble par des caractère d'un autre ensemble ...

```bash
$ cat /etc/os-release \
   | grep "^ID" \
   | tr '=' ' '
ID manjaro

$ echo "coucou" | tr 'a-q' 'A-Q'
COuCOu
```

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `awk`

`awk` est un processeur de texte assez puissant ...
- En pratique, il est souvent utilisé pour "récupérer seulement une ou plusieurs colonnes"
- Attention à la syntaxe un peu compliquée !

```bash
$ cat /etc/os-release  \
    | grep "^ID"       \
    | tr '=' ' '       \
    | awk '{print $2}' \
manjaro

$ who | awk '{print $1 " " $4}'
alex 22:10
r2d2 11:27
```

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `awk`

- L'option `-F` permet de specifier un autre délimiteur

```bash
cat /etc/passwd | awk -F: '{print $3}'  # Affiche les UID des utilisateurs
```

(Equivalent à `cat /etc/passwd | cut -d: -f 3`)

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `sort`

`sort` est un outil de tri :
- `-k` permet de spécifier quel colonne utiliser pour trier (par défaut : la 1ère)
- `-n` permet de trier par ordre numérique (par défaut : ordre alphabetique)

```bash
ps -ef | sort         # Trie les processus par proprietaire (1ere col)
ps -ef | sort -k2 -n  # Trie les processus par PID (2eme col., chiffres)
```

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `uniq`

`uniq` permet de ne garder que des occurences uniques ... ou de compter un nombre d'occurence (avec `-c`)

`uniq` s'utilise 90% du temps sur des données **déjà triées** par sort

```bash
who | awk '{print $1}' | sort | uniq                   # Affiche la liste des users loggués
who | awk '{print $1}' | sort | uniq -c                # Compte le nombre de shell par user loggué
```

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `sed`

`sed` est un outil de manipulation de texte très puissant ... mais sa syntaxe est complexe.

Comme premier contact : utilisation pour chercher et remplacer : `s/motif/remplacement/g`

Exemple :
```bash
ls -l | sed 's/alex/padawan/g' # Remplace toutes les occurences de alex par padawan
```

---

# 3 - Pipes et boîte à outils

## Boîte à outils : `find`

`find` permet de trouver (recursivement) des fichiers répondant à des critères sur le nom, la date de modif, la taille, ...

Exemples:
```bash
# Lister tous les fichiers en .service dans /etc
find /etc -name "*.service"

# Lister tous les fichiers dans /var/log modifiés il y a moins de 5 minutes
find /var/log -mmin 5
```

---

# 3 - Pipes et boîte à outils

## Recap (QUELQUES outils)

(en tout cas leur utilisation la plus commune)

- `tee` : montrer la sortie dans le terminal tout en la copiant dans un fichier
- `tr` : supprimer / remplacer certains caractères
- `grep` : garder seulement les lignes qui matchent (ou pas) une expression
- `awk` : garder seulement une colonne de donnée
- `cut` : garder seulement une colonne de donnée (similaire à `awk` mais différent)
- `sort` : trier des données
- `uniq` : garder seulement des lignes uniques (ou compter combien d'occurences)
- `sed` : chercher et remplacer une expression par une autre
- `find` : chercher des fichiers qui correspondent à certains critères (nom, date de modif, ...)

---

class: impact

# 4 - Écrire et executer des scripts

---

# 4 - Écrire / executer

## Des scripts

- `bash` <small>(`/bin/bash`)</small> est un interpreteur
    - en mode interactif, un interpréteur de commande est souvent appelé un shell
- Plutôt que de faire de l'interactif, on peut écrire une suite d'instruction qu'il doit executer (un script)
- Un script peut être considéré comme un type de programme <small>(caractérisé par le fait qu'il reste de taille modeste)</small>

---

# 4 - Écrire / executer

## Utilité des scripts bash

Ce que ça ne fait généralement **pas** :
- du calcul scientifique
- des interfaces graphiques / web
- des manipulations 'fines' d'information

Ce que ça fait plutôt bien :
- prototypage rapide
- automatisation de tâches d'administration (fichiers, commandes, ..)
- de la "glue" entre différents programmes
- simplifier des procédures complexes mais en gardant une dose de paramétrabilité / interactivité

---

# 4 - Écrire / executer

## Ecrire un script (1/2)

```bash
#!/bin/bash

# Un commentaire
cmd1
cmd2
cmd3
...

exit 0    # (Optionnel, 0 par defaut)
```

---

# 4 - Écrire / executer

## Ecrire un script (2/2)

```bash
#!/bin/bash

echo "Hello, world !"
echo "How are you today ?"
```

---

# 4 - Écrire / executer

## `exit`

- `exit` permet d'interrompre le script immédiatement
- `exit 0` quitte et signale que tout s'est bien passé
- `exit 1` (ou une valeur différente de 0) quitte et signale un problème

---

# 4 - Écrire / executer

## Executer un script (1/3)

Première façon : avec l'interpreteur `bash`

- `bash script.sh` execute `script.sh` dans un processus à part
- on annonce explicitement qu'il s'agit d'un script bash
    - dans l'absolu, pas besoin d'avoir mis `#!/bin/bash`

---

# 4 - Écrire / executer

## Executer un script (2/3)

Deuxième façon : avec `source`

- `source script.sh` execute le script **dans** le terminal en cours
- 95% du temps, ce n'est pas `source` qu'il faut utiliser pour votre cas d'usage !
- Cas d'usage typique de `source` : recharger le `.bashrc`
- (Autre cas : `source venv/bin/activate` pour les virtualenv python)

---

# 4 - Écrire / executer

## Executer un script (3/3)

Troisième façon : en donnant les permissions d'execution à votre script

```
chmod +x script.sh   # À faire la première fois seulement
./script.sh
```

- l'interpreteur utilisé sera implicitement celui défini après le `#!` à la première ligne
- (dans notre cas : `#!/bin/bash`)

---

# 4 - Écrire / executer

## Parenthèse sur la variable `PATH` (1/2)

La variable d'environnement `PATH` défini où aller chercher les programmes

```bash
$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/sbin

$ which ls
/usr/bin/ls

$ which script.sh
which: no script.sh in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin
```

---

# 4 - Écrire / executer

## Parenthèse sur la variable `PATH` (2/2)

```bash
$ ./script.sh  # Fonctionnera (si +x activé)
$ script.sh    # Ne fonctionnera a priori pas
```

Néanmoins il est possible d'ajouter des dossiers à `PATH` :

```bash
PATH="$PATH:/home/padawan/my_programs/"
```

Ensuite, vous pourrez utiliser depuis n'importe où les programmes dans `~/my_programs` !

---

# 4 - Écrire / executer

## Résumé

- `bash script.sh` est la manière "explicite" de lancer un script bash
- `./script.sh` lance un executable (+x) via un chemin absolu ou relatif
- `source script.sh` execute le code *dans le shell en cours* !
- `script.sh` peut être utilisé seulement si le script est dans un des dossier de `PATH`

---

class: impact

# 5 - Les variables

---

# 5 - Les variables

De manière générale, une variable est :
- un contenant pour une information
- une façon de donner un nom à cette information

Initialiser une variable en bash (attention à la syntaxe) :

```bash
PI="3.1415"
```

Utiliser une variable :

```bash
echo "Pi vaut (environ) $PI"
```

N.B. : différence contenu/contenant sans trop d'ambiguité


---

# 5 - Les variables

On peut modifier une variable existante :

```bash
$ HOME="/home/alex"
$ HOME="/var/log"
```

... sauf si définie comme `readonly` !

```bash
$ readonly PI="2"           # ... oopsie !
$ PI="3.14"
-bash: PI: readonly variable
```

---

# 5 - Les variables

Initialiser une variable à partir du résultat d'une autre commande

```bash
NB_DE_LIGNES=$(wc -l < /etc/login.defs)
```

Syntaxe équivalente avec des backquotes <small>(ou backticks)</small> (historique, dépréciée)

```bash
NB_DE_LIGNES=`wc -l < /etc/login.defs`
```

---

# 5 - Les variables

On peut également initialiser une variable en composant avec d'autres variables :

```bash
MY_HOME="/home/$USER"
```

ou encore :

```bash
FICHIER="/etc/login.defs"
NB_DE_LIGNES=$(wc -l < $FICHIER)
MESSAGE="Il y a $NB_DE_LIGNES lignes dans $FICHIER"
echo "$MESSAGE"
```

---

# 5 - Les variables

## Notes diverses (1/5)

- En bash, on manipule du texte !

```bash
$ PI="3.14"

$ NOMBRE="$PI+2"

$ echo $NOMBRE
3.14+2           # littéralement !
```

---

# 5 - Les variables

## Notes diverses (2/5)

- Lorsqu'on utilise une variable, il faut mieux l'entourer de quotes :

```bash
$ FICHIER="document signé.pdf"

$ ls -l $FICHIER
ls: cannot access 'document': No such file or directory
ls: cannot access 'signé.pdf': No such file or directory

$ ls -l "$FICHIER"
-rw-r--r-- 1 alex alex 106814 Mar  2  2018 'document signé.pdf'
```

---

# 5 - Les variables

## Notes diverses (3/5)

- ACHTUNG : une variable inexistante est interprétée comme une chaîne vide... !

```bash
$ NB_DE_LIGNES=42
$ echo "$NB_DE_LINGE"
                        # <<< ligne vide !
```

- (On peut utiliser `set -eu` au début d'un script pour traiter ces cas comme des erreurs et arrêter le déroulement du script)

---

# 5 - Les variables

## Notes diverses (4/5)

- Pour utiliser une variable sans ambiguité, il est peut être nécessaire de l'ecrire avec `${VAR}` :

```bash
$ FICHIER=/var/log/stuff

$ cp $FICHIER $FICHIER_old
cp: missing destination file operand after 'stuff'
# (car la variable `FICHIER_old` n'existe pas !)

$ cp $FICHIER ${FICHIER}_old
# fonctionne !
```

---

# 5 - Les variables

## Notes diverses (5/5)

- L'utilisation de 'simple quotes' permet d'éviter l'interpretation des variables :
- On peut aussi utiliser \ pour echapper un caractère :

```bash
$ echo "Mon home est $HOME"
Mon home est /home/alex

$ echo 'Mon home est $HOME'
Mon home est $HOME

$ echo "Mon home est \$HOME"
Mon home est $HOME
```

---

class: impact

# 6 - Paramétrabilité / interactivité

---

# 6 - Paramétrabilité / interactivité

- Le comportement d'un script peut être paramétré via des options ou des données en argument
- On peut également créer de l'interactivité, c'est à dire demander des informations à l'utilisateur pendant que l'execution du programme


---

# 6 - Paramétrabilité / interactivité

## Les paramètres

- `$0` contient le nom du script
- `$1` contient le premier argument
- `$2` contient le deuxieme argument
- et ainsi de suite ...
- `$#` contient le nombre d'arguments total 
- `$@` corresponds à "tous les arguments" (en un seul bloc)

---

# 6 - Paramétrabilité / interactivité

```bash
#!/bin/bash

echo "Ce script s'apelle $0 et a eu $# arguments"
echo "Le premier argument est : $1"
echo "Le deuxieme argument est : $2"
```

```bash
$ ./monscript.sh coucou "les gens"
Ce script s'apelle monscript.sh et a eu 2 arguments
Le premier argument est : coucou
Le deuxieme argument est : les gens
```

---

# 6 - Paramétrabilité / interactivité

```bash
#!/bin/bash

echo "Ce script s'apelle $0 et a eu $# arguments"
echo "Le premier argument est : $1"
echo "Le deuxieme argument est : $2"
```

```bash
$ ./monscript.sh coucou
Ce script s'apelle monscript.sh et a eu 2 arguments
Le premier argument est :
Le deuxieme argument est :
```


---

# 6 - Paramétrabilité / interactivité

## Interactivité

Il est possible d'attendre une entrée de l'utilisateur avec `read` :

```bash
echo -n "Comment tu t'appelles ? "
read NAME
echo "OK, bonjour $NAME !"
```

---

class: impact

# 7 - Les conditions

---

# 7 - Les conditions

## Généralités

Les conditions permettent d'adapter l'execution d'un programme en fonction de cas particuliers...

---

# 7 - Les conditions

## Avec les doubles crochets (1/3)

```bash
NB_TERMINAUX_OUVERTS=$(ps -ef | grep bash | wc -l)

if [[ "$NB_TERMINAUX_OUVERTS" -ge "5" ]]
then
   echo "Il y a pleins de terminaux ouverts sur cette machine !"
else
   echo "Il n'y a que $NB_TERMINAUX_OUVERTS sur cette machine "
fi
```

---

# 7 - Les conditions

## Avec les doubles crochets (2/3)

```bash
if [[ ! -f "$HOME/.bashrc" ]] 
then
   echo "Tu devrais créer un bashrc !"
fi
```

---

# 7 - Les conditions

## Avec les doubles crochets (3/3)

```bash
if [[ expression ]]
then
   cmd1
   cmd2
   ...
else
   cmd3
   cmd4
fi
```

N.B. : Il n'est pas nécessaire d'avoir un `else` ! 

---

# 7 - Les conditions

## Tester des valeurs numériques

- `[[ X -eq Y ]]` : X **equals** to Y
- `[[ X -ne Y ]]` : X **not equals** to Y
- `[[ X -ge Y ]]` : X is **greater than or equals** to Y
- `[[ X -le Y ]]` : X is **lesser than or equals** to Y
- `[[ X -gt Y ]]` : X is **greater than** to Y
- `[[ X -lt Y ]]` : X is **lesser than** to Y

Par exemple pour tester qu'une variable `ANSWER` est supérieure à 42 : 

```bash
[[ "$ANSWER" -gt "42" ]]
```

---

# 7 - Les conditions

## Tester des chaînes de caractère

- `[[ CHAINE1 == CHAINE2 ]]` : les chaines sont égales
- `[[ CHAINE1 != CHAINE2 ]]` : les chaines sont différentes
- `[[ CHAINE =~ REGEX ]]` : la chaîne matche la regex..
- `[[ -z CHAINE ]]` : la chaîne est vide (zero length)
- `[[ -n CHAINE ]]` : la chaîne n'est pas vide (non-zero length)

Exemples :
```bash
[[ "$USER" == "root" ]]   # Teste si l'on a à faire à l'user root 
[[ -z "$ANSWER" ]]        # Teste que la variable ANSWER n'est pas vide
[[ "$USER" =~ "r2d2\|c3p0" ]]  # Teste si l'on a à faire à r2d2 ou c3p0 
```

---

# 7 - Les conditions

## Tester des fichiers

- `[[ -e FILE ]]`   # Teste si FILE existe
- `[[ -f FILE ]]`   # Teste si FILE est un fichier regulier
- `[[ -d FILE ]]`   # Teste si FILE est un dossier

Exemples:
```bash
[[ -d "$HOME/documents" ]] # Teste si le dossier documents existe
[[ -f "$HOME/.bashrc" ]]   # Teste si vous avez un fichier .bashrc
```

---

# 7 - Les conditions

## Combiner des expressions

- `[[ ! expression ]]`         # Teste l'opposé de expression
- `[[ expr1 ]] && [[ expr2 ]]` # Teste que expr1 ET expr2 sont vraies
- `[[ expr1 ]] || [[ expr2 ]]` # Teste si expr1 OU </small>(inclusif)</small> expr2 est vrai

Exemples
```bash
[[ ! -e "$HOME/.bashrc" ]]     # Teste que votre .bashrc n'existe pas
[[ "$CPU_USE" > "100" ]] && [[ "$MEM_FREE" < 0 ]]
```

---

# 7 - Les conditions

## Syntaxe avec une commande

```bash
if commande
then
   cmd1
   cmd2
   ...
else
   cmd3
   cmd4
fi
```

---

# 7 - Les conditions

## Syntaxe avec une commande : exemple

```bash
if grep -q "r2d2" /etc/passwd
then
   echo "r2d2 est bien enregistré en tant qu'utilisateur"
else
   echo "r2d2 n'est pas enregistré en tant qu'utilisateur !"
fi
```

---

# 7 - Les conditions

## Note sur les expressions entre crochet

`[[ expression ]]` peut être utilisé comme une vraie commande ! 

C'est souvent moins lourd à écrire pour des petites choses :

```bash
[[ -f "$HOME/.bashrc" ]] || echo "Tu devrais créer un bashrc !"
```

---

# 7 - Les conditions

## Erreurs courantes (1/2)

Confusion entre `[[ ]]` et `cmd` : 

```bash
if [[ ma_commande ]]      # Devrait être simplement: if ma_commande
```

ou même

```bash
if [[ $(ma_commande) ]]   # Devrait être simplement: if ma_commande
```

éventuellement on peut écrire (pour vérifier que la sortie de la commande n'est pas vide:

```bash
if [[ -z "$(ma_commande)" ]]
```


---

# 7 - Les conditions

## Erreurs courantes (1/2)

Confusion sur le code de retour

```bash
function ma_fonction()
{
    if blah
    then
        return 0
    else
        return 1
    fi
}

if [[ $(ma commande) == 0 ]]    # Devrait être simplement: if ma_commande
```





---


.center[
![](img/brackets.jpeg)
]



---

class: impact

#  Bash scripts

### 8 - Les fonctions

---

# 8 - Les fonctions

## Généralités

Les fonctions sont comme des commandes, qui existent dans le contexte d'un script
Comme les commandes, elles ont un `stdin`, `stdout`, `stderr`, des arguments (`$1`, `$2`, ...) et un code de retour

L'objectif d'une fonction est :
- de rassembler des commandes en une tâche bien définie
- de donner un nom **pertinent** à cette tâche
- (de rendre cette tâche paramétrable)
- pouvoir appeler cette tâche plusieurs fois
- de structurer le code d'un script

---

# 8 - Les fonctions

## Exemple

Initialiser un utilisateur :
- (il faut un nom)
- créer l'utilisateur (`useradd`)
- créer son home
- créer un `.bashrc`
- mettre les bonnes permissions sur ses dossier/fichiers
- définir un quota
- ...


---

# 8 - Les fonctions

## Exemple concret (non testé)

```bash
function create_droid()
{
    local NAME="$1" 

    useradd $NAME
    mkdir /home/$NAME
    echo "alias ls='ls --color=auto'" > /home/$NAME/.bashrc
    chown -R $NAME:$NAME /home/$NAME
    adduser $NAME droid

    return 0
}

create_droid r2d2
create_droid c3p0
create_droid bb8
```

---

# 8 - Les fonctions

## Syntaxe

```bash
function ma_fonction()
{
    cmd1
    cmd2
    cmd3

    return 0   # Optionnel
}
```

---

# 8 - Les fonctions

## Code de retour

```bash
function create_droid()
{
    local NAME="$1" 
    if grep "^$NAME" /etc/passwd
    then
       echo "Un utilisateur $NAME existe deja !"
       return 1
    fi

    # [...]

    return 0
}
```

---

# 8 - Les fonctions

## Variables locales

- Dans une fonction, il est possible de définir des variables locales avec le mot clef `local`
- Ces variables et leur valeurs n'ont de sens que dans le contexte de cette fonction
- Généralement utilisé pour clarifier les paramètres attendus

```bash
function set_quota()
{
   local USER="$1"
   local LIMIT="$2"

   # [...]
}

set_quota r2d2 100M
echo $LIMIT   ## << Ne fonctionnera pas !
```

---

class: impact

# 9 - Boucles `for` / `while`

---

# 9 - Boucles `for` / `while`

## Généralités sur les boucles

Répéter des instructions :
- sur une liste de valeurs / données (boucles `for`)
- ou tant qu'une condition est vraie (boucles `while`)

---

# 9 - Boucles `for` / `while`

## Boucle `for`

```bash
for I in $(seq 1 10)
do
    echo "I vaut $I"
done
```

```bash
I vaut 1
I vaut 2
I vaut 3
...
I vaut 10
```

---

# 9 - Boucles `for` / `while`

## Boucle `for`

```bash
for FILENAME in $(ls)
do
    cp "$FILENAME" "/home/alex/backups/${FILENAME}.bkp"
done
```

---

# 9 - Boucles `for` / `while`

## Boucle `for`

```bash
for USER in $(cat /etc/passwd | awk -F: '{print $1}')
do
   SHELL=$(grep "^$USER:" /etc/passwd | awk -F: '{print $7}')
   echo "L'user $USER a comme login de shell : $SHELL"
done
```

---

# 9 - Boucles `for` / `while`

## Boucle `while`

```bash
I=10
while [[ "$I" -ge 0 ]]
do
   echo "Maintenant I vaut $I"
   I=$(bc <<< "$I-1")
done
```

```
Maintenant I vaut 10
Maintenant I vaut 9
Maintenant I vaut 8
...
Maintenant I vaut 0
```

---

# 9 - Boucles `for` / `while`

## Boucle `while`

Tant qu'une condition est vérifiée ...

```bash
while [[ "$NUMBER" -ge 0 ]]
do
    echo "Donne un nombre négatif !"
    read NUMBER
done
echo "Bien ouej ! $NUMBER est effectivement un nombre négatif !"
```

---

# 9 - Boucles `for` / `while`

## Boucle `while`

```bash
while [[ -z "$(ip a | grep 'inet ' | awk '{print $2}' | grep -v '127.0.0.1')" ]]
do
   echo "Waiting ..."
   sleep 1
done
```




---

class: impact

# 10 - Bonnes pratiques

---

FIXME / TODO

    - bash -x
    - TODO / FIXME : defensive bash programming, shfmt
    - getopts, construire un vrai script (usage, --help etc)
    - set -eux, autres options,
    - exec pour rediriger un fichier, utilitaires de logging


---

class: impact
# 11 - Les expressions régulières

---

.center[
https://www.commitstrip.com/wp-content/uploads/2014/02/Strips-Le-dernier-des-vrais-codeurs-650-final2.jpg
]

---

.center[
![](img/iknowregex.jpg)
]

---

.center[
![](img/iknowregularexpressions.png)
]


---

# 11 - Les expressions régulières

## Principe

- Un formalisme pour décrire la structure d'une chaîne de caractère
- Utile pour rechercher, valider, modifier des données en masse
- Par exemple : un numéro SIRET
    - 9 chiffres, peut-être séparé par des espaces
    - Version simple: `\d{9}`
    - Version un peu plus évoluée : `[\d ?]{8}\d`
- Utilisable dans pleins de langage de programmation, et outils des outils comme `grep`, `sed`, éditeurs de textes, ...
- Tests en ligne : `regex101.com`
- Attention, utilisation dans grep : `grep -E` ou `-P` (?)
- Plusieurs normes de regex : PCRE, lua, ...


---

# 11 - Les expressions régulières

## Les ancres

- `^` : désigne le début de la chaîne de caractère
- `$` : désigne la fin de la chaîne de caractère

Exemple : matcher le dieze d'une ligne de commentaire : `^#`

---

# 11 - Les expressions régulières

## Les classes de caractères

- `[abc]` : match le caractère `a`, `b` ou `c`
- `[a-z]` : match n'importe quel caractère entre `a` et `z`
- `[a-zA-Z0-9]` : match n'importe quel lettre ou chiffre
- `[A-Z0-9_\.+-#]` : match n'importe quel lettre ou chiffre ou `_`, `.`, `+`, `-`, `#`
- `[^a-z]` : match n'importe quel caractère qui n'est PAS dans `a-z`
- `[^a-z0-9]` : match n'importe quel caractère qui n'est PAS dans `a-z0-9` 

---

# 11 - Les expressions régulières

## Les classes de caractères

- Exemple : `[hH]ello [wW]orld`
    - match `hello world`
    - match `Hello world`
    - match `hello World`
    - match `Hello World`

---

# 11 - Les expressions régulières

## Les classes de caractères

- `\d` : chiffre décimal, équivalent à `[0-9]`
- `\w` : "word character", ~équivalent à `[a-zA-Z0-9_]`
- `\s` : caractère d'espacement (espace, tabulation, ...)
- `.` : wildcard, n'importe quel caractère
    - pour matcher littéralement un `.`, on utilisera `\.`

---

# 11 - Les expressions régulières

## Les classes de caractères

- Exemple : `\d\d\d\d\d`
    - match un code postal (cinq chiffres)
    - `75000`
    - `67234`
    - `00000`
    - `99999`
    - ...

---

# 11 - Les expressions régulières

## Les quantifieurs

- `a?` match le caractère `a` 0 ou 1 fois
- `a+` match le caractère `a` 1 fois ou plus
- `a*` match le caractère `a` 0 fois ou plus
- `a{3}` match le caractère `a` 3 fois exactement
- `a{3,10}` match le caractère `a` entre 3 et 10 fois
- `a{3,}` match le caractère `a` 3 fois ou plus
- `\w{3,}` match un mot d'au moins 3 caractères


---

# 11 - Les expressions régulières

## Les classes de caractères

- Exemple : `\d{5}`
    - match un code postal (cinq chiffres)
    - `75000`
    - `67234`
    - `00000`
    - `99999`
    - ...


---

# 11 - Les expressions régulières

## Les classes de caractères

- Exemple: `\d{2} ?\d{3}` (ou bien : `\d{2}\s?\d{3}`)
    - match un code postal (cinq chiffres) avec peut-être un espace après les deux premiers chiffres
    - `75000`
    - `67234`
    - `67 234`
    - `00000`
    - `99999`
    - ...

---

# 11 - Les expressions régulières

## Les groupes

- `(hello){3}` matche `hellohellohello`
- `(hello)*` matche (chaine vide), `hello`, `hellohello`, ...
- `([hH]ello )?world` matche `world`, `hello world` et `Hello world`
- `(hello|world|pikachu)` matche `hello` OU `world`

---

# 11 - Les expressions régulières

## Exemple évolué

- Matcher un numéro de téléphone français (européen ?)
    - 10 chiffres, premier chiffre = 0
    - peut-être des espaces ou des `.` entre les chiffres
    - peut-être que le 0 est remplacé par un indicateur comme `+33`

---

# 11 - Les expressions régulières

## Exemple évolué

- Matcher un numéro de téléphone français (européen ?)
    - 10 chiffres, premier chiffre = 0
        - `0\d{9}`

---

# 11 - Les expressions régulières

## Exemple évolué

- Matcher un numéro de téléphone français (européen ?)
    - 10 chiffres, premier chiffre = 0
        - `0\d{9}`
    - peut-être des espaces ou des `.` entre les chiffres
        - `0(\d[\.\s]?){8}\d`

---

# 11 - Les expressions régulières

## Tester des regex en ligne :  Exemple évolué

- Matcher un numéro de téléphone français (européen ?)
    - 10 chiffres, premier chiffre = 0
        - `0\d{9}`
    - peut-être des espaces ou des `.` entre les chiffres
        - `0(\d[\.\s]?){8}\d`
    - peut-être que le 0 est remplacé par un indicateur comme `+33`
        - `(\+\d{2,3}[\.\s]?|0)(\d[\.\s]?){8}\d`


---

.center[
![](img/perfectregexemail.jpg)
]

---

class: impact

# 12 - Automatiser avec `at` et les cron jobs

---

# 12 - Automatiser

## Executer des commandes (ou un script) à distance

```
# Verifier depuis combien de temps la machine tourne
$ echo "uptime" | ssh machine
 19:48:51 up 1 day,  2:05,  1 user,  load average: 0.08, 0.02, 0.01

# Lancer un script à distance
$ cat script.sh | ssh machine
[...]
```

---

# 12 - Automatiser

## `at`

- Executer *une fois* une action à un moment précis dans le futur
- Format de date/temps plutôt user-friendly

```bash
# En interactif
$ at 5:00 PM     
warning: commands will be executed using /bin/sh
at> reboot
job 5 at Fri Oct 12 17:00:00 2018
```

```bash
# Avec un script
$ at now + 30 minutes -f mettre_a_jour.sh 
job 6 at Thu Oct 6 20:22:00 2018
```

---

# 12 - Automatiser 

## Les jobs cron

- Répéter une tâche à intervalle régulier (heures, jours, mois, ...)
- Chaque utilisateur peut en configurer avec `crontab -e`

```
10 * 1 * * /chemin/vers/un/script
```

---

# 12 - Automatiser

## Les jobs cron : syntaxe (1/3)

```
10 * 1 * * /chemin/vers/un/script
```

- `10` : à la minute 10
- `*`  :toutes les heures
- `1` le 1er du mois
- `*` tous les mois
- `*` (tous les jours de la semaine)

---

# 12 - Automatiser

## Les jobs cron : syntaxe (2/3)

```
0 8 * * 1-5 /chemin/vers/un/script
```

- `0` : à la minute 0
- `8` : à 8h
- `*` (tous les jours du mois)
- `*` tous les mois
- `1-5` tous les jours de travail (lundi à vendredi)

---

# 12 - Automatiser

## Les jobs cron : syntaxe (3/4)

```text
 */10 * * * * /chemin/vers/un/script
```

- `*/10` : toutes les 10 minutes
- `*` toutes les heures
- `*` tous les jours du mois
- `*` tous les mois
- `*`  tous les jours de la semaine

---

# 12 - Automatiser

## Les jobs cron : syntaxe (4/4)

- `http://crontab.guru/` to the rescue !

---

# 12 - Automatiser

## `/etc/crontab` et `/etc/cron.d/`

- Ce sont des fichiers/dossiers de config cron "globaux"
- Dedans, on specifie aussi l'utilisateur utilisé pour lancer le script :

```
 # M  H  D M W   User    Command --->
 */30 *  * * * feed2toot feed2toot -c /etc/feed2toot/feed2toot.ini
```

---

# 12 - Automatiser

## `/etc/cron.hourly`, `daily`, `weekly`, `monthly`

- Ils contiennent directement des scripts qui seront executés automatiquement à certains intervalles
- Attention
   - le nom des fichiers dedans ne doit pas avoir d'extensions ...
   - .. et doit être executable (+x)

---

class: impact

# 13 - Misc / Astuces / syntaxes avancées

---

- Programmation parallèle
- eval
- tableaux
- manip bash cheloues style ${foo:-}
