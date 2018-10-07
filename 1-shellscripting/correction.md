# Feuille d'exercices n.2

### 8. Personnaliser son environnement

- 8.1 : Un exemple de personnalisation de PS1 est : 

```bash
PS1="[\033[01;32m\u on \h\033[0m:\033[01;34m\w\033[0m] \n> "
```

- 8.2 : Ajouter la ligne précédente en bas de `~/.bashrc` à l'aide de nano puis recharger avec `source ~/.bashrc`
- 8.3 : Même chose que 8.2 mais en rajoutant une ligne comme : 

```bash
echo "May the source be with you
```
- 8.4 : Ouvrir `/root/.bashrc` avec nano (et possiblement sudo) puis rajouter une ligne pour modifier le PS1, comme :

```bash
PS1="[\033[01;31m\u on \h\033[0m:\033[01;34m\w\033[0m] \n> "
```

(noter la couleur '31' = rouge)

- 8.5 : Taper `ll` pour tester si la commande existe. Si elle n'existe pas, rajouter `alias ll='ls -l'` dans le bashrc puis le recharger avec `source`. Pour s'assurer que `ls` utiliser `--color=auto` par défaut, taper `alias ls`.
- 8.6 : Taper `alias suls='sudo ls -la'` (par exemple) et `alias sucat='sudo cat'`. Tester en tant que padawan de taper `suls /root` et `sucat /etc/shadow` (ou d'autres dossiers / fichiers accessibles uniquement par root).
- 8.7 : `alias r2d2="sudo su r2d2"` puis tester de taper `r2d2`.
- 8.8 : Se renseigner sur Internet ;P (question un peu 'extra')
- 8.9 : `alias ls="echo 'Pas envie'"`

## 9 partie 1 - redirections et assemblages

- 9.1 : `echo "hello, howdy ?!" > hello.txt`
- 9.2 : `ls /usr/bin/ > files.tmplist` puis `less files.tmplist`
- 9.3 : (depuis votre home) `mkdir ./dev; mkdir ./dev/bash; echo "Je fais du bash !" > ./dev/bash/intro`
- 9.4 : `ls /undossier >/dev/null 2>&1 && echo "J'ai le droit !" || echo "J'ai pas le droit !" `
- 9.5 : Mettre des calculs comme `6*7` ligne par ligne dans un fichier comme `calc.txt` puis lancer `bc < calc.txt`. On peut aussi faire `bc <<< "6*7"` 
- 9.6 : `curl -L fr.wikipedia.org > wikipedia.html >/dev/null 2>&1 || echo "ça n'a pas marché !"`
- 9.7 : 

```bash
touch /tmp/chat
chmod +w /tmp/chat
tail -f /tmp/chat &
```

puis faire `echo "beep boop" >> /tmp/chat` depuis d'autres terminaux (attention, il y a deux chevrons !).

Il est possible de créer l'alias `say` qui parle dans le chat avec :

```bash
alias say="echo [$USER] >> /tmp/chat"
```

## 9 partie 2 - pipes et boîte à outils

- 9.8 : utiliser `alias grep` pour verifier que l'alias existe, sinon ajouter `alias grep="grep --color=auto"` au `.bashrc` et le recharger.
- 9.9 : `cat /etc/passwd | grep "/bin/bash"`
- 9.10 : `cat /etc/passwd | grep "/bin/bash" | tr ':' ' ' | awk '{print $1}'` (on peut aussi utiliser `awk -F:`, ou la commande `cut`)
- 9.11 : `cat /etc/passwd | grep "nologin$" | tr ':' ' ' | awk '{print $1}'`
- 9.12 : Les utilisateurs n'ayant pas de mot de passe sont typiquement caractérisés par un `:x:` sur la ligne (ou eventuellement un `:!:`) dans `/etc/shadow`. On utilise alors un grep 'inversé' (`-v`) pour obtenir les lignes des utilisateurs qui ont vraiment un mot de passe. On utilise aussi un "ou" dans grep (avec `\|`) pour ignorer à la fois les lignes contenant `:!:` et `:x:`.

```bash
cat /etc/shadow | grep -v ":\!:\|:x:" | awk -F: '{print $1}'
```

- 9.13 : On affiche le fichier en ignorant les lignes commençant (`^`) par `#` : `cat /etc/login.defs | grep -v "^#"`.
- 9.14 : On verifie que `groups` contient `sudo`. La sortie standard ne nous intéresse pas, donc on peut la supprimer avec `>/dev/null` ou l'option `-q` de `grep` :

```bash
groups | grep -q sudo && echo "oui!" || echo "non :'("
```

- 9.15 : `grep -nr "daemon" /etc/`
- 9.16 : Les lignes vides correspondent à `^$` (début de ligne suivi de fin de ligne) donc : `cat /etc/login.defs | grep -v "^$"` Pour enlever également les commentaires, on utilise un "ou" dans grep (`\|`), ce qui donne : `cat /etc/login.defs | grep -v "^$\|^#"`
- 9.17 : Similaire à la question 9.14 : `who | grep -q r2d2 && echo "R2d2 est là !" || echo "Mais que fais r2d2 ?!"`
- 9.18 : `ps -ef | grep -v "UID" | awk '{print $1}' | sort | uniq -c`
- 9.19 : `cat loginattempts.log  | awk '{print $9}' | sort | uniq -c | sort -n`
- 9.20 : Il s'agit d'un exercice un peu avancé avec plusieurs solutions possibles (qui ne sont pas trop robuste, mais peuvent dépanner). En voici une qui envoie les adresses des images dans un fichier `img.list` :

```bash
curl yoloswag.team           \
 | grep "img src"            \
 | sed 's/img src/\n[img]/g' \
 | grep "\[img\]"            \
 | tr '<>"' ' '              \
 | awk '{print $2}'          \
 > img.list
```

## 10 partie 1 - les variables

- 10.1 : `mkdir ~/dev/; mkdir ~/dev/bash; cd ~/dev/bash`, puis `nano hello.py` pour commencer à éditer un nouveau fichier. Dedans, mettre:

```bash
#!/bin/bash

echo "Hello world !"
echo "How are you today ?"
```

On peut ensuite executer ce script avec `bash hello.py` ou avec `./hello.py` (si vous lui avez ajouté la permission d'execution)

- 10.2 : Un exemple de solution est :

```bash
#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[33m"
YELLOW="\033[34m"
PURPLE="\033[35m"
NORMAL="\033[0m"

echo "Hello world"
echo -e "${PURPLE}How ${BLUE}are ${GREEN}you ${YELLOW}today ${RED}?${NORMAL}"
```

- 10.3 : Un exemple de solution est :

```bash
#!/bin/bash

DISTRIB_NAME=$(cat /etc/os-release | grep PRETTY_NAME | awk -F= '{print $2}')
NB_USERS=$(who | awk '{print $1}' | sort | uniq | wc -l)
MEM_TOTAL=$(free -h | grep "^Mem:" | awk '{print $2}')
MEM_FREE=$(free -h | grep "^Mem:" | awk '{print $4}')

echo "La distribution est $DISTRIB_NAME"
echo "Il y a actuellement $NB_USERS utilisateur.ice.s différent.e.s loggués"
echo "Il reste $MEM_TOTAL disponible sur un total de $MEM_FREE"
```

## 10 partie 2 - paramétrabilité, interactivité

- 10.4 : (c.f. cours)
- 10.5 : Un exemple de solution est ce script, qui peut être appelé avec par exemple `./script3.sh 5 13`

```bash
#!/bin/bash

RESULTAT=$(bc <<< "$1+$2")
echo "$1 + $2 = $RESULTAT"
```

- 10.6 : Un exemple de solution est ce script. (Note : on aurait aussi pu utiliser `date +%Y` pour obtenir l'année courante.

```bash
#!/bin/bash

echo -n "Quel est ton année de naissance ? "
read ANNEE
AGE=$(bc <<< "2018 - $ANNEE")
echo "Tu as $AGE ans !"
```

- 10.7 : Un exemple de solution est le script suivant (il est aussi possible de résoudre ce probleme plus facilement  lisiblement avec des "vraies" conditions) 

```bash
#!/bin/bash

FILENAME="$1"
ls $FILENAME >/dev/null 2>&1 \
    && { echo "Le fichier existe !"; exit 0; } \
    || { echo "Uhoh !? Pas sur que ce fichier existe !"; exit 1; }
```

- 10.8, 10.9 : Exemple de solution

```bash
#!/bin/bash

readonly BACKUP_FOLDER="$HOME/bkp"

FILENAME=$1

./exists.sh $FILENAME || exit 1
ls $BACKUP_FOLDER >/dev/null 2>&1 || mkdir $BACKUP_FOLDER

cp $FILENAME $BACKUP_FOLDER \
   && echo "Le fichier a bien été backupé en tant que $BACKUP_FOLDER/$FILENAME"
```

- 10.10 : Exemple de solution

```bash
#!/bin/bash

echo -n "Quel utilisateur faut-il vérifier ? "
read USER

grep -q "^$USER:" /etc/passwd || { echo "$USER n'existe pas !"; exit 1; }

NB_PROCESS=$(ps au -u $USER | wc -l)
NB_TERM=$(who | grep "^$USER " | wc -l)
SPACE_USED=$(du -hs /home/$USER | awk '{print $1}')

echo "L'utilisateur :"
echo " - a $NB_PROCESS processus en cours"
echo " - a $NB_TERM terminaux ouverts"
echo " - utilise $SPACE_USED "
```

## 10 partie 3 - les conditions

- 10.11 : Un exemple de solution est de rajouter les conditions suivantes après avoir récupéré l'année :

```bash
if [[ "$ANNEE" -le 1900  ]];
then
    echo "Hmmm, t'es sur !?"
    exit 1
fi
if [[ "$ANNEE" -gt 2018  ]];
then
    echo "Tu viens du turfu !?"
    exit 1
fi
```

- 10.13 :

```bash
#!/bin/bash

if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]
then
    echo ""
    echo "   check_user.sh"
    echo ""
    echo "Permet de vérifier qu'un utilisateur n'exploite"
    echo "pas n'importe comment les ressources du système"
    echo ""
    echo "Lancer le script avec ./check_user.sh"
    echo "puis entrez le nom d'utilisateur"
    echo ""
    exit 0
fi

echo -n "Quel utilisateur faut-il vérifier ? "
read USER

if ! grep -q "^$USER:" /etc/passwd
then
    echo "L'utilisateur '$USER' n'existe pas !"
    exit 1
fi

NB_PROCESS=$(ps au -u $USER | wc -l)
NB_TERM=$(who | grep "^$USER " | wc -l)
SPACE_USED=$(du -hs /home/$USER | awk '{print $1}')
SPACE_USED_OCTETS=$(du -s /home/$USER | awk '{print $1}')

echo "L'utilisateur :"
echo " - a $NB_PROCESS processus en cours"
echo " - a $NB_TERM terminaux ouverts"
echo " - utilise $SPACE_USED "

if [[ "$NB_PROCESS" -gt 50 ]]
then
   echo "L'utilisateur a trop de processus actifs !" >&2
fi
if [[ "$NB_TERM" -gt 5 ]]
then
   echo "L'utilisateur a ouvert trop de terminaux !" >&2
fi
if [[ "$SPACE_USED_OCTETS" -gt 1000000 ]]
then
   echo "L'utilisateur utilise plus que 1 Go de stockage !"
fi
```

