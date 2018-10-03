# Correction des exercices

### 6. Permissions

- 6.1 : Faire `touch xwing.conf` puis `ls -l xwing.conf` pour analyser les proprietaires et permissions actuelles. Changer le proprietaire/groupe si necessaire avec `chown padawan:padawan xwing.conf`. Reverifier les modifications avec `ls -l xwing.conf`
- 6.2 : `touch private`, puis `chmod ugo-rwx private` par exemple (on peut aussi le faire en plusieurs étapes)
- 6.3 : `chmod u+r private`, puis `chmod ug+w private`, puis `chmod +x private`
- 6.4 : `chmod ugo-rwx private` (ou `chmod 000 private`)
- 6.5 : `chmod 731 private` (car `rwx-wx--x` s'écrit 731 en octal)
- 6.6 : `chmod go-rx /home/padawan`
- 6.7 : `chmod -R o-rwx ~/documents` par exemple
- 6.8 : en tant que root : `mkdir /home/r2d2`
- 6.9 : en tant que root : `chown r2d2 /home/r2d2` puis `chmod go-rx /home/r2d2` devrait suffir (eventuellement enlever le `w` aussi)
- 6.10 : `touch /home/r2d2/droid.conf` puis par exemple `cd /home/r2d2` et `chown r2d2:droid ./droid.conf`
- 6.11 : (en étant dans `/home/r2d2/`) `touch beep.wav boop.wav blop.wav` puis `chown r2d2 *.wav` et, par exemple, `chmod go-x *.wav` et `chmod u+x *.wav`
- 6.12 : `mkdir secrets` puis `touch secrets/nsa.pdf` (eventuellement mettre du texte dans `secrets/nsa.pdf`). Ensuite : `chmod -r secrets/` desactive le listage des fichiers dans `secrets/` ... pourtant, il est possible de faire `cat secrets/nsa.pdf` !
- 6.13 : Si l'on essaye de faire un `chown` en tant que `padawan`, le système refusera ! (On ne peut pas donner ses fichiers à quelqu'un d'autre)

### 7. Processus

- 7.1 : Faire `sleep 30` puis Ctrl+Z et `bg` pour mettre la commande en arrière plan. Constater que vous pouvez de nouveau taper des commandes. Faire `jobs` dans les secondes qui suivent et constater que la commande est toujours 'Running'. Appuyer sur 'Entrée' régulièrement pendant les secondes qui suivent jusqu'à ce que 'Done' s'affiche.
- 7.2 : Faire `sleep 30` puis Ctrl+Z et `bg` pour mettre la commande en arrière plan. Constatez que vous pouvez de nouveau taper des commandes. Avant que la commande ne se termine (au bout des 30 secondes), faire `fg` pour récupérer la main sur le `sleep` puis faites Ctrl+C.
- 7.3 : Faire `sleep 30 &` et constater que vous pouvez taper des commandes. Noter aussi que la console a affiché le PID du programme correspondant au `sleep`. Utiliser ce PID pour tuer le programme avec `kill <PID>`. 
- 7.4 : Lancer `sleep 700000` (par exemple) puis faire `ps -ef` dans un autre terminal et constater que le processus est bien listé (vous pouvez aussi utiliser 'top' et les fleches)
- 7.5 : Dans le `ps -ef` utiliser précédemment, vous pouvez trouver le PPID (parent PID) à côté du PID. Vous pouvez regarder dans le reste de la liste pour checher le programme correspondant à ce PPID (apriori il s'apelle 'bash').
- 7.6 - Connaissant le PID du parent, utiliser `kill <PID>` ou `kill -9 <PID>` pour tuer le shell. Vous devriez constater que la session est détruite.
- 7.7 - Lancer `top` : celui tout en haut consomme actuellement le plus de CPU. Si vous appuyez sur `Shift+M`, les programmes seront maintenant trié par utilisation de la RAM.
- 7.8 - Lancer la commande `openssl speed -multi 4`, puis relancer `top` : vous devriez voir que 4 processus consomment maintenant beaucoup de CPU
- 7.9 - Lancer `nice -n 19 ls /bin` : vous devriez voir que cette commande est trèèèès longue.
- 7.10 - Identifier le PID des différent process openssl. Utiliser `renice +10 <PID>` pour changer leur niceness. En utilisant `top`, la colonnee 'NI' devrait maintenant indiquer une niceness différente de 0. Après avoir réduit la niceness de ces processus, relancer `nice -n 19 ls /bin` devrait être un peu plus rapide.
- 7.11 - `pkill openssl`
- 7.12 - Lancez `screen` et dedans, `sleep 30`. Faites `Ctrl+A` puis `D` pour détacher la session. Eventuellement `screen -list` pour lister les sessions screen. Depuis un autre terminal, faites `screen -r` et constatez que vous récupérez bien le shell ou vous aviez lancé `sleep 30`.
- 7.13 - Avec `ps -ef` ou `ps -ef --forest`, vous devriez voir le processus `sleep 30` (ou relancez le si il a déjà terminé). Son parent devrait être un `bash`. Après avoir trouvé le PID de ce parent, faites `kill -9 <PID>` pour tuer cette session. Vous deviez constater que la session est détruite.

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

