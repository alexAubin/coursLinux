# Correction des exercices

### 6. Permissions

- 6.1 : Faire `touch xwing.conf` puis `ls -l xwing.conf` pour analyser les proprietaires et permissions actuelles. Changer le proprietaire/groupe si necessaire avec `chown padawan:padawan xwing.conf`. Reverifier les modifications avec `ls -l xwing.conf`
- 6.2 : `touch private`, puis `chmod ugo-rwx private` par exemple (on peut aussi le faire en plusieurs étapes)
- 6.3 : `chmod u+r private`, puis `chmod ug+w private`, puis `chmod +x private`
- 6.4 : `chmod ugo-rwx private` (ou `chmod 000 private`)
- 6.5 : `chmod 731 private` (car `rwx-wx--x` s'écrit 731 en octal)
- 6.6 : `chmod go-rx /home/padawan`
- 6.7 : `chmod -R o-rwx ~/documents` par exemple
- 6.8 : en tant que root : `mkdir /home/r2d2`, puis en tant que root : `chown r2d2 /home/r2d2` puis `chmod go-rx /home/r2d2` devrait suffir (eventuellement enlever le `w` aussi)
- 6.9 : `touch /home/r2d2/droid.conf` puis par exemple `cd /home/r2d2` et `chown r2d2:droid ./droid.conf`
- 6.10 : (en étant dans `/home/r2d2/`) `touch beep.wav boop.wav blop.wav` puis `chown r2d2 *.wav` et, par exemple, `chmod go-x *.wav` et `chmod u+x *.wav`
- 6.11 : `mkdir secrets` puis `touch secrets/nsa.pdf` (eventuellement mettre du texte dans `secrets/nsa.pdf`). Ensuite : `chmod -r secrets/` desactive le listage des fichiers dans `secrets/` ... pourtant, il est possible de faire `cat secrets/nsa.pdf` !
- 6.12 : Si l'on essaye de faire un `chown` en tant que `padawan`, le système refusera ! (On ne peut pas donner ses fichiers à quelqu'un d'autre)
- 6.13 : (pour que cela fonctionne, il faut installer le paquet `acl` avec `apt install acl`) `setfacl -m g:droid:r-x /home/padawan` puis faire `ls -l` sur le dossier et constater le `+` à la fin des permissions. On peut regarder le détails des ACL avec `getfacl /home/padawan`
- 6.14 : `setfacl -m u:padawan:r-x /home/r2d2`

### 7. Processus

- 7.1 - Il faut lancer `ps -ef --forest` et lire attentivement la sortie pour trouver `cinnamon-session` et un processus nommé `bash` (et/ou `gnome-terminal-server` qui devrait être le parent des processus `bash`). Trouver le processus qui consomme le plus de CPU et de RAM se fait avec `top` (utiliser `shift+M` pour trier par utilisation de la RAM). Dans `ps -ef --forest`, il est possible aussi de trouver des processus qui tourne en tant que des utilisateurs système, tel que `systemd-*`.
- 7.2 - En utilisant l'url du programme, faire `wget https://url/du/programme` pour le récupérer dans votre machine. Puis lancer `bash fibonnaci_forever.sh`.
- 7.3 - En ayant `bash fibonnaci_forever.sh` qui tourne, faire `Ctrl+Z` puis `bg` pour mettre le programme en arrière plan. Confirmer avec `jobs` qu'il tourne bien en arrière plan. Notez que la sortie de la commande continue de s'afficher dans le terminal (bien que le programme n'a pas la main dessus)
- 7.4 - Après avoir trouvé le PID avec `ps -ef --forest`, faire `kill PID`.
- 7.5 - `bash fibonnaci_forever.sh &` (notez le `&` à la fin de la commande)
- 7.6 - Si l'on tue le shell (c'est-à-dire le processus `bash` qui a lancé la commande `bash fibonnaci_forever.sh`), alors cela tue complètement la fenêtre de terminal plutôt que juste l'execution de `fibonnaci_forever.sh`.
- 7.7 - Lancez `screen` et dedans, `bash fibonnaci_forever.sh`. Faites `Ctrl+A` puis `D` pour détacher la session. Eventuellement `screen -list` pour lister les sessions screen. Depuis un autre terminal, faites `screen -r` et constatez que vous récupérez bien le shell ou vous aviez lancé `fibonnaci_forever.sh`.
- 7.8 - Après avoir trouvé le PID avec `ps -ef --forest`, faire `kill PID`.

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
- 8.9 : `alias ls="echo 'G pas envie'"`

## 9 - redirections et assemblages

- 9.1 : `echo "hello" > hello.txt`, puis faire `cat hello.txt` pour confirmer le résultat attendu
- 9.2 : `echo "world" >> hello.txt`, puis faire `cat hello.txt` pour confirmer le résultat attendu
- 9.3 : `ls /usr/bin/ > files.tmplist` puis `less files.tmplist`
- 9.4 : `bash fibonnaci_forever.sh > suite_de_fibonnaci`, puis `Ctrl+C` après quelques secondes, puis `cat suite_de_fibonnaci` pour confirmer le résultat attendu
- 9.4 : écrire `2+2`, `6\*7`, `10/3` (sur plusieurs lignes) dans un fichier `calcul`, puis faire `bc < calcul`
- 9.5 : `bc <<< "6*7"`
- 9.6 : `mkdir -p ~/formation_linux/calculs; echo '6*7' > ~/formation_linux/calculs/formule; bc < ~/formation_linux/calculs/formule > ~/formation_linux/calculs/reponse`
- 9.7 : `curl -L fr.wikipedia.org > wikipedia.html >/dev/null 2>&1 || echo "ça n'a pas marché !"`
- 9.8 :

```bash
mkdir /tmp/chat/
touch /tmp/chat/chat
chmod +w /tmp/chat/chat
tail -f /tmp/chat/chat &
```

puis faire `echo "beep boop" >> /tmp/chat/chat` depuis d'autres terminaux (attention, il y a deux chevrons !).

Il est possible de créer l'alias `say` qui parle dans le chat avec :

```bash
alias say="echo [$USER] >> /tmp/chat/chat"
```

## 10 - pipes et boîte à outils

- 10.1 : utiliser `alias grep` pour verifier que l'alias existe, sinon ajouter `alias grep="grep --color=auto"` au `.bashrc` et le recharger.
- 10.2 : `cat /etc/passwd | grep "/bin/bash"`
- 10.3 : `cat /etc/passwd | grep "/bin/bash" | tr ':' ' ' | awk '{print $1}'` (on peut aussi utiliser `awk -F:`, ou la commande `cut`)
- 10.4 : `cat /etc/passwd | grep "nologin$" | tr ':' ' ' | awk '{print $1}'`
- 10.5 : Les utilisateurs n'ayant pas de mot de passe sont typiquement caractérisés par un `:x:` sur la ligne (ou eventuellement un `:!:`) dans `/etc/shadow`. On utilise alors un grep 'inversé' (`-v`) pour obtenir les lignes des utilisateurs qui ont vraiment un mot de passe. On utilise aussi un "ou" dans grep (avec `\|`) pour ignorer à la fois les lignes contenant `:!:` et `:x:`.

```bash
sudo cat /etc/shadow | grep -v ":\!:\|:x:" | awk -F: '{print $1}'
```

- 10.6 :

```bash
alias esquecestleweekend='date | grep "^Sat \|^Sun " >/dev/null && echo "Cest le weekend" && echo "Cest le weekend" || echo "Arg il faut encore taffer!"
```

- 10.7 : Les lignes vides correspondent à `^$` (début de ligne suivi de fin de ligne) donc : `cat /etc/login.defs | grep -v "^$"` Pour enlever également les commentaires, on utilise un "ou" dans grep (`\|`), ce qui donne : `cat /etc/login.defs | grep -v "^$\|^#"`
- 10.8 : `dpkg-query --status vim | grep -q 'Status: install ok installed' && echo Oui || echo Non`
- 10.9 : `grep -nr "daemon" /etc/`
- 10.10 : `ps -ef | grep -v "UID" | awk '{print $1}' | sort | uniq -c`
- 10.11 : `cat loginattempts.log  | awk '{print $9}' | sort | uniq -c | sort -n`
- 10.12 : Il s'agit d'un exercice un peu avancé avec plusieurs solutions possibles (qui ne sont pas trop robuste, mais peuvent dépanner). En voici une qui envoie les adresses des images dans un fichier `img.list` :

```bash
curl yoloswag.team           \
 | grep "img src"            \
 | sed 's/img src/\n[img]/g' \
 | grep "\[img\]"            \
 | tr '<>"' ' '              \
 | awk '{print $2}'          \
 > img.list
```
