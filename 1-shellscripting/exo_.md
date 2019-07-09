# Scripting Bash - Feuille d'exercices

### 8. Personnaliser son environnement

- 8.1 - Personnaliser l'apparence de votre invite de commande (syntaxe, couleurs) en modifiant la variable PS1.
- 8.2 - Ajouter la personnalisation de l'invite à votre `.bashrc` et propagez ces changements sur vos shells ouverts.
- 8.3 - Ajouter aussi un message de bienvenue comme "May the force be with you!" qui s'affichera à chaque ouverture d'un shell.
- 8.4 - Changer le .bashrc de root pour que son invite de commande soit en rouge !
- 8.5 - S'assurer que vous disposez de l'alias `ll` (pour `ls -l`), et que `--color=auto` est activé implicitement lorsque vous utilisez `ls`.
- 8.6 - Créer des alias `suls` et `sucat` qui permettent de lister les fichiers d'un dossier, ou d'afficher le contenu d'un fichier en activant automatiquement `sudo`. Tester ces alias en tapant `suls /root` et `sucat /etc/shadow` en tant que padawan.
- 8.7 - Créer un alias `r2d2` qui permet d'ouvrir un shell en tant que `r2d2` avec `sudo` et `su`.
- 8.8 - (Avancé) Se renseigner sur `LS_COLORS` et personnaliser cette variable.
- 8.9 - En utilisant `echo`, comment faire pour faire en sorte que la commande 'ls' retourne systématiquement 'J'ai pas envie' au lieu de son comportement normal ?

## 9 partie 1 - redirections et assemblages

- 9.1 - Créer un fichier à l'aide de `echo` et d'une redirection
- 9.2 - Dans un tty, inspecter la liste des fichier de `/usr/bin` avec `ls` n'est pas pratique, car la sortie est trop longue et il n'est pas possible de scroller vers le haut. Pour contourner le probleme, enregistrez la sortie dans un fichier puis lisez-là avec `less`. 
- 9.3 - En **une seule ligne de commande**  (qui pourra comporter plusieurs sous-commandes) : créer un dossier `dev` dans votre répertoire personnel, puis créer un sous-dossier `bash`, et dedans un fichier `intro` qui contient "Je fais du bash, c'est stylé !"
- 9.4 - Écrire **une seule ligne de commande** qui attendra 15 secondes sans rien faire (à l'aide de `sleep`) et affichera "J'ai terminé!" si et seulement si la commande sleep s'est terminée correctement. Testez et validez le comportement en laissant `sleep` finir, et dans un autre cas en annulant la commande prématurément à l'aide de Ctrl+C.
- 9.5 - Écrire **une seule ligne de commande** qui affichera (uniquement) "J'ai le droit" ou "J'ai pas le droit" si il vous est possible de lister le contenu du dossier `/root` à l'aide de `ls`. (Testez et validez le comportement en faisant l'expérience avec d'autres dossiers)
- 9.6 - `bc` est un utilitaire permettant de faire de petit calculs. Testez `bc` en mode interactif pour faire quelques additions (Ctrl+D pour quitter). Mettez maintenant une suite de calcul dans un fichier, que vous injecterez directement dans `bc`. Enfin, faites des calculs similaire mais en injectant directement une chaine dans `bc`.
- 9.7 - `curl` est un utilitaire qui permet de telecharger et le code source d'une page (par exemple, fr.wikipedia.org) dans la console. 
    - Comment pouvez-vous faire pour sauvegarder cette page dans un fichier ? 
    - Retentez l'expérience avec une adresse qui n'existe pas, et modifiez votre commande pour supprimer les erreurs mais afficher tout de même "Ca n'a pas marché" dans le cas où vous tentez de télécharger une page qui n'existe pas...
- 9.8 - (Avancé) Créez un fichier `/tmp/chat` dans lequel padawan et r2d2 peuvent tous les deux écrire. Renseignez-vous sur l'option `-f` de la commande `tail` puis :
    - Lancez `tail -f /tmp/chat` en tâche de fond dans deux terminaux (l'un de padawan, l'autre de r2d2) ;
    - À l'aide de redirections, envoyez des messages dans le fichier `/tmp/chat` et observez les deux terminaux ;
    - Améliorez le système en créant un alias `say` qui affiche un message préfixé de votre nom d'utilisateur (ex: [r2d2] beep boop).
    
## 9 partie 2 - pipes et boîte à outils

- 9.9 - Si ce n'est pas deja le cas, ajoutez un alias pour activer automatiquement `--color=auto` chaque fois que la commande `grep` est utilisée. Essayez quelque manipulation avec `grep` pour confirmer que les occurences trouvées sont bien mises en valeur.
- 9.10 - Lister les lignes de `/etc/passwd` qui correspondent aux utilisateurs ayant `/bin/bash` comme shell de login
- 9.11 - Meme chose, mais cette fois en affichant uniquement le nom des utilisateurs
- 9.12 - Lister les utilisateurs (uniquement leur nom !) qui ont comme shell de login `nologin`
- 9.13 - lister les utilisateurs (uniquement leur nom) qui ont un mot de passe non vide
- 9.14 - Ecrivez un alias `canisudo` qui vérifie que vous êtes dans le groupe sudo
- 9.15 - Sachant que pour grep, `^`et `$` désignent un début et une fin de ligne, pouvez-vous affichez le contenu de `/etc/login.defs` sans les commentaires, puis sans les commentaires ni les lignes vides ?
- 9.16 - En analysant les options de `grep`, trouvez un moyen de lister toutes les occurences du mot `daemon` dans tous les fichiers à l'intérieur de `/etc/` (recursivement)
- 9.17 - Écrivez une ligne de commande qui affiche "Oui" ou "Non" si r2d2 est actuellement connecté. On pourra pour ce faire utiliser (entre autre chose) le fait que `grep` a un code de retour, et eventuellement l'option `-q`.
- 9.18 - À l'aide de `ps`, `sort` et `uniq` générer un bilan du nombre de processus actuellement en cours par utilisateur
- 9.19 - À l'aide de `sort` et `uniq`, analysez le fichier `loginattemps.log`, et produisez un résumé du nombre de tentative de connections par ip
- 9.20 - (Avancé) Construisez une ligne de commande qui récupère les adresses des images présentes dans le code du site `yolowag.team`. Vous aurez possiblement besoin de `curl`, `grep`, `tr` et `awk` (eventuellement de `sed`).

## 10 partie 1 - les variables

- 10.1 - Créez-vous un répertoire de travail (par exemple : `~/dev/bash`) dans lequel vous créerez vos scripts. Écrivez un premier script `hello.sh` qui affiche "Hello world !" et "How are you today ?" et executez-le.
- 10.2 - En reprenant les codes couleurs étudiés en partie 8, définissez des variables de couleur comme `PURPLE` qui vaut `\033[35m`. Modifier le code de la question 10.1 pour affichez "How are you today ?" avec les couleurs de l'arc-en-ciel ! (Rappel : si il y a des couleurs, `echo` doit être appelé avec l'option `-e`)
- 10.3 - Dans des variables différentes, récupérez des informations comme :
    - le nom de la distribution (via `/etc/os-release`)
    - le nombre d'utilisateurs (différents) actuellement loggé au système (via who)
    - la quantité de RAM totale et utilisée (voir `free -h`)
puis affichez un rapport comme :
```
La distribution est Debian Stretch
Il y a actuellement 4 utilisateurs différents loggués
Il reste 262Mo de RAM disponible sur un total de 5.5G
```
- 10.4 - Relancer le script avec `bash -x votrescript.sh` et analyser ce qui s'affiche : cette commande est utile pour débugger ce qu'il se passe dans un script !

## 10 partie 2 - paramétrabilité, interactivité

- 10.5 - Écrivez un script `test_args.sh` qui affiche le nom du script, le nombre d'argument donnés, ainsi que le premier et deuxième argument.
- 10.6 - Écrivez un script `add.sh` qui prends deux nombre en argument en affiche le résultat de leur addition.
- 10.7 - Écrivez un script `age.sh` qui demande à l'utilisateur son année de naissance, puis calcule et affiche son âge. 
- 10.8 - Créez un script `exist.sh` qui prends un nom de fichier en argument, et affiche "Le fichier existe !" et renvoie 0 si il est possible de faire `ls` sur le fichier, et affiche "Uh Oh !? Pas sur que ce fichier existe !" et renvoie 1 sinon.
- 10.9 - Créez un script `bkp.sh` qui prends un nom de fichier en argument, et qui créé une copie de ce fichier dans `~/bkp/` (le dossier sera automatiquement créé par le script si besoin). Le script affichera finalement un message comme "Le fichier a été backupé en tant que ~/bkp/fichier".
- 10.10 - Dans `bkp.sh`, avant de lancer la copie, faites appel à `exist.sh` pour vérifier que le fichier existe bel et bien avant de continuer.
- 10.11 - Créez un script `check_user.sh`. Il est destiné à être lancé par `root` pour s'assurer qu'un utilisateur donné ne fait pas n'importe quoi. Implémentez les étapes suivantes une par une, en les testant au fur et à mesure :
   - Demander un nom d'utilisateur ;
   - Vérifier que l'utilisateur existe via `/etc/passwd`, sinon afficher un message d'erreur (dans stderr !) et arrêter le script avec un code de retour de 1 ;
   - Compter le nombre de processus actuellement lancés par cet utilisateur (aidez-vous de `ps au -u <user>`) et affiché un message comme "L'utilisateur a X procesus en cours" ;
   - Même chose, mais avec le nombre de terminaux actuellement utilisés par l'utilisateur ;
   - Calculer l'espace disque occupé par le repertoire personnel de l'utilisateur (aidez-vous de `du -hs <repertoire>`). Afficher un message comme "Son repertoire personnel pèse X Mo".

## 10 partie 3 - les conditions

- 10.12 - Reprendre le script `age.sh` de l'énoncé 10.7. Vérifiez que l'année de naissance fait sens. Par exemple, si elle est inférieure à 1900, on pourra afficher "Hmm... T'es sur !?", et si l'année donnée est supérieure à 2018, on pourra afficher "Tu viens du futur !?". Dans les deux cas, on quittera le programme en renvoyant un code d'erreur
- 10.13 - Un peu dans la même veine que l'énoncé 10.8, écrire un script `whatis.sh` qui prends un nom de fichier en argument, et affiche "C'est un fichier régulier", "C'est un dossier" ou bien "Ce fichier n'existe pas !". (Pour garder une syntaxe claire, se renseigner sur `elif`)
- 10.14 - En reprenant `check_user.sh` :
    - modifier le test que l'utilisateur existe bien en utilisant maintenant la syntaxe `if then ... fi`
    - adaptez le comportement du script de sorte à ce que `./check_user.sh --help` (ou `-h`) affichera (au lieu du fonctionnement normal de la fonction) une description de ce que fait le script et de comment l'utiliser.
    - ajoutez des tests de sorte que le script râlera si il se trouve que l'utilisateur a lancé plus que 50 processus, et/ou plus que 5 terminal, et/ou si son répertoire personnel dépasse une certaine taille.

## 10 partie 4 - les fonctions

- 10.14 - Comme en 10.2, créer un script `utils.sh` qui défini des variables correspondant aux couleurs. À l'aide de celles-ci, implémentez et testez au fur à mesure les fonctions suivantes :
    - `success` qui prends un message en argument et affiche `"[ OK ] Le message"` avec le mot `OK` en vert ;
    - `info`    qui prends un message en argument et affiche `"[INFO] Le message"` avec le mot `INFO` en bleu ;
    - `warning` qui prends un message en argument et affiche *dans la sortie d'erreur* `"[WARN] Le message"` avec le mot `WARN` en orange ;
    - `error`   qui prends un message en argument et affiche *dans la sortie d'erreur* `"[FAIL] Le message"` avec le mot `FAIL` en rouge ;
    - `critical` qui prends un message en argument et affiche *dans la sortie d'erreur* `"[CRIT] Le message"` avec le mot `CRIT` en rouge, **et termine directement le script avec un code de retour de 1**.
- 10.15 - Dupliquez le script `check_user.sh` de la question 10.11 (la copie peut s'appeler `check_user_v2.sh`), puis transformez les différentes parties du script en fonctions. Ce genre de travail s'appelle *(re)factoriser du code*.  **Testez vos modifications au fur et à mesure !**
    - au début (après le `#!/bin/bash`), ajoutez `source utils.sh` pour charger les fonctions définies dans `utils.sh` dans ce script.
    - introduisez une fonction `assert_user_exists` qui affichera une erreur et arrêtera le script (via `critical`) si l'utilisateur n'existe pas ;
    - introduisez une fonction `usage` qui sera appelée pour décrire le fonctionnement du script si appelé avec `--help` ou `-h` ;
    - introduisez une fonction `check_processes` qui vérifiera que le nombre de processus lancé n'est pas trop élevé. Si le nombre n'est pas trop grand, affichez le nombre avec `info` - ou avec `warn` sinon.
    - de façon similaire, une fonction `check_terminals`
    - de façom similaire, une fonction `check_home_space_usage`
- 10.16 - Finalement, adaptez le script pour qu'il affiche à la fin que tout va bien avec `success` si aucun problème n'a été détecté, ou `fail` pour signifier que l'utilisateur a dépassé les bornes des limites !

## 10 partie 5 - les boucles

- 10.17 - Écrivez à l'aide d'une boucle `for` un script qui compte 2 par 2 jusqu'à 100.
- 10.18 - Même chose, mais à l'aide d'une boucle `while`.
- 10.19 - En reprenant le script `check_user.sh`, utilisez une boucle `for` pour lancer ce script sur tous les utilisateurs ayant `/bin/bash` comme shell de login.
- 10.20 - Écrivez un script `confirm.sh` qui, à l'aide d'une boucle `while`, demande à l'utilisateur `Est-ce que tu es sur ? [oui/non]` tant qu'il n'a pas répondu `oui` ou `non`.
- 10.21 - Revenant du mariage de votre tante ou cousine, vous décidez de partager vos 100 photos avec le reste de votre famille. Sachant que vos appareil photo dernier-cri prends des photos en moulte-méga-pixels qui pèsent 10 Mo chacune, vous décidez qu'il faut mieux redimensionner les images avant de les envoyer pour ne pas surcharger les boîtes mails de tout le monde avec 1Go de photos. Pour ce faire, renseignez-vous sur la commande `convert` (du paquet
  ImageMagick) qui permet de redimensionner (ou *rescaler*) et éventuellement d'adapter le niveau de qualité. Sachant maintenant manipuler cette commande, écrivez une boucle `for` pour redimensionner d'un seul coup toutes les images `jpg` présentent dans le dossier courant. (Pour tester votre script, vous pouvez télécharger par exemple des images sur `pixabay.com`)
- 10.22 - Ecrire en bash un jeu qui consiste à demander à l'utilisateur de deviner un nombre choisi aléatoirement par le programme. L'utilisateur entrera un nombre, et le programme dira à l'utilisateur si le nombre à trouver est plus petit ou plus grand, jusqu'à ce que le bon nombre soit trouvé.

## 11 - Tâches automatiques avec `cron` et `at`

- 11.1 - Utiliser `at` (via un script) pour écrire, au bout de deux minutes, les mots "C'est automagique !" dans un fichier `magic.txt`. Dans les secondes avant que la tâche ne se déclenche, regardez le contenu du dossier `/var/spool/atjobs/`.
- 11.2 - Sur votre serveur, dans un des dossiers `/etc/cron.*`, remarquez l'existence d'un script `logrotate`. Renseignez-vous sur l'utilité et la raison d'être de ce script/programme.
- 11.3 - À l'aide de `wget`, ajoutez un cron job qui télécharge dans votre HOME chaque minute une image de chaton différente depuis `https://placekitten.com/` (on pourra utiliser la variable `$RANDOM` pour obtenir un entier aléatoire)
- 11.4 - Sur votre serveur, téléchargez quelques images de chatons (ou autre) dans un nouveau dossier `img` dans `/var/www/mywebiste` (c.f. 7.3 et 7.4). Créez un script (non automatisé pour le moment) qui permet de choisir une image aléatoire parmis toute celles disponible, et utilise cette image sur votre page d'acceuil. Pour ce faire, : 
    - vous pouvez choisir un nombre aléatoirement avec la variable spéciale `$RANDOM`, 
    - mettre en place un fichier `template.html` qui contient le code de votre page web mais où le chemin de l'image est un mot clef comme `CHEMIN_IMAGE`. Votre script pourra alors utiliser `sed` pour généner `index.html` en remplacant `CHEMIN_IMAGE` par le vrai chemin.
- 11.5 - Une fois votre script validé, ajouter un job cron qui lancera ce script toutes les minutes pour choisir une nouvelle image aléatoirement
- 11.6 - Même principe, mais cette fois créez une page `monitor.html` qui contiendra des informations régulièrement mises à jour (e.g. toutes les quelques minutes) à propos du serveur : RAM utilisée / disponible, uptime, processus les plus gourmands, l'heure qu'il est, et un rapport des IPs récemment bannies par fail2ban ...
