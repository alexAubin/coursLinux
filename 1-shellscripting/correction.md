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

```
touch /tmp/chat
chmod +w /tmp/chat
tail -f /tmp/chat &
```

puis faire `echo "beep boop" >> /tmp/chat` depuis d'autres terminaux (attention, il y a deux chevrons !).

Il est possible de créer l'alias `say` qui parle dans le chat avec :

```
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

```
groups | grep -q sudo && echo "oui!" || echo "non :'("
```

- 9.15 : `grep -nr "daemon" /etc/`
- 9.16 : Les lignes vides correspondent à `^$` (début de ligne suivi de fin de ligne) donc : `cat /etc/login.defs | grep -v "^$"` Pour enlever également les commentaires, on utilise un "ou" dans grep (`\|`), ce qui donne : `cat /etc/login.defs | grep -v "^$\|^#"`
- 9.17 : Similaire à la question 9.14 : `who | grep -q r2d2 && echo "R2d2 est là !" || echo "Mais que fais r2d2 ?!"`
- 9.18 : `ps -ef | grep -v "UID" | awk '{print $1}' | sort | uniq -c`
- 9.19 : `cat loginattempts.log  | awk '{print $9}' | sort | uniq -c | sort -n`
- 9.20 : Il s'agit d'un exercice un peu avancé avec plusieurs solutions possibles (qui ne sont pas trop robuste, mais peuvent dépanner). En voici une qui envoie les adresses des images dans un fichier `img.list` :

```
curl yoloswag.team           \
 | grep "img src"            \
 | sed 's/img src/\n[img]/g' \
 | grep "\[img\]"            \
 | tr '<>"' ' '              \
 | awk '{print $2}'          \
 > img.list
```

