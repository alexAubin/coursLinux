# Scripting Bash - Feuille d'exercices

### 8. Personnaliser son environnement

- 8.1 - Personnaliser l'apparence de votre invite de commande (syntaxe, couleurs) en modifiant la variable PS1 : par exemple, afficher le nom de la machine en jaune.
- 8.2 - Ajouter la personnalisation du PS1 à votre `.bashrc` et propagez ces changements sur vos shells ouverts.
- 8.3 - Ajouter aussi un message de bienvenue comme "May the force be with you!" qui s'affichera à chaque ouverture d'un shell (rappel : `echo` peut être utilisé pour afficher un tel message).
- 8.4 - Changer le `.bashrc` de root pour que son invite de commande soit en rouge !
- 8.5 - S'assurer que vous disposez de l'alias `ll` (pour `ls -l`), et que `--color=auto` est activé implicitement lorsque vous utilisez `ls`.
- 8.6 - Créer un alias `amiconnected` qui éxecute la commande `ping` sur l'IP 8.8.8.8 avec l'option `-q` et l'option `-c 1`
- 8.7 - Créer un alias `r2d2` qui permet d'ouvrir un shell en tant que `r2d2` avec `sudo` et `su`.
- 8.8 - En utilisant `echo`, comment faire pour faire en sorte que la commande `ls` retourne systématiquement 'Bof, G pas envie' au lieu de son comportement normal ?
- 8.9 - (Avancé) Se renseigner sur `LS_COLORS` et personnaliser cette variable.

## 9 partie 1 - redirections et assemblages

- **9.1** - Créer un fichier à l'aide de `echo` et d'une redirection. Par exemple, un fichier `hello.txt` qui contient `"Hello, world!"`
- **9.2** - Dans un tty, regarder le résultat de `ls /usr/bin` n'est pas pratique, car la sortie est trop longue et il n'est pas possible de scroller vers le haut. Pour contourner le probleme, enregistrez la sortie dans un fichier puis lisez-là avec `less`. 
- 9.3 - En **une seule ligne de commande**  (qui pourra comportera plusieurs sous-commandes séparées par `;`) : créer un dossier `formationlinux` dans votre répertoire personnel, puis créer un sous-dossier `bash`, et dedans un fichier `intro` qui contient "Je fais du bash, c'est stylé !"
- **9.4** - `bc` est un utilitaire permettant de faire de petit calculs. Testez `bc` en mode interactif pour faire quelques additions (Ctrl+D pour quitter). Mettez maintenant une suite de calcul dans un fichier, que vous injecterez directement dans `bc`. Enfin, faites des calculs similaires mais en injectant directement une chaine dans `bc`.
- **9.5** - `curl` est un utilitaire qui permet de telecharger et le code source d'une page (par exemple, fr.wikipedia.org) dans la console. 
    - Comment pouvez-vous faire pour sauvegarder cette page dans un fichier ?
    - Retentez l'expérience avec une adresse qui n'existe pas, et modifiez votre commande pour supprimer les erreurs mais afficher tout de même "Ca n'a pas marché" dans le cas où vous tentez de télécharger une page qui n'existe pas...
- 9.6 - (Avancé) Créez un fichier `/tmp/chat` dans lequel padawan et r2d2 peuvent tous les deux écrire. Renseignez-vous sur l'option `-f` de la commande `tail` puis :
    - Lancez `tail -f /tmp/chat` en tâche de fond dans deux terminaux (l'un de padawan, l'autre de r2d2) ;
    - À l'aide de redirections, envoyez des messages dans le fichier `/tmp/chat` et observez les deux terminaux ;
    - Améliorez le système en créant un alias `say` qui affiche un message préfixé de votre nom d'utilisateur (ex: [r2d2] beep boop).
    
## 9 partie 2 - pipes et boîte à outils

- 9.7 - Si ce n'est pas deja le cas, ajoutez un alias pour activer automatiquement `--color=auto` chaque fois que la commande `grep` est utilisée. Essayez quelques manipulations avec `grep` pour confirmer que les occurences trouvées sont bien mises en valeur.
- **9.8** - Lister les lignes de `/etc/passwd` qui correspondent aux utilisateurs ayant `/bin/bash` comme shell
- **9.9** - Même chose, mais cette fois en affichant uniquement le nom des utilisateurs
- **9.10** - Lister les utilisateurs (uniquement leur nom !) qui ont comme shell `nologin`
- **9.11** - Lister les utilisateurs (uniquement leur nom) qui ont un mot de passe non vide (rappel : historiquement les passwords se trouvaient dans `/etc/passwd`, mais ce n'est plus le cas de nos jours !)
- **9.12** - Écrivez un alias `estcequecestleweekend` qui vérifie si on est Samedi ou Dimanche en utilisant `date`
- 9.13 - Sachant que pour grep, `^`et `$` désignent un début et une fin de ligne, pouvez-vous affichez le contenu de `/etc/login.defs`
    - sans les commentaires (ce sont les lignes commençant par #) 
    - puis sans les commentaires ni les lignes vides ? (Indice : une ligne vide est une ligne qui se commnence puis se termine tout de suite)
- 9.14 - Écrire **une seule ligne de commande** qui affichera (uniquement) "Oui" ou "Non" suivant si par exemple le paquet `vim` est installé. Pour tester si un paquet est installé, on pourra se baser sur `dpkg --list` ou bien sur `dpkg-query --status <nom_du_paquet>` (Testez et validez le comportement avec d'autres paquets)
- **9.15** - À l'aide des pages de man de `grep`, trouvez un moyen de lister toutes les occurences du mot `daemon` dans tous les fichiers à l'intérieur de `/etc/` (recursivement)
- 9.16 - Écrivez une ligne de commande qui affiche "Oui" ou "Non" si r2d2 est actuellement connecté. On pourra pour ce faire utiliser (entre autre chose) le fait que `grep` a un code de retour, et eventuellement l'option `-q`.
- **9.17** - À l'aide de `ps`, `sort` et `uniq` générer un bilan du nombre de processus actuellement en cours par utilisateur
- **9.18** - À l'aide de `sort` et `uniq`, analysez le fichier `loginattempts.log` (demander au formateur comment l'obtenir), et produisez un résumé du nombre de tentative de connections par ip
- 9.19 - (Avancé) Construisez une ligne de commande qui récupère les adresses des images présentes dans le code du site `yoloswag.team`. Vous aurez possiblement besoin de `curl`, `grep`, `tr`, `awk` et `sed`.

## 10 partie 1 - les variables

- **10.1** - Créez-vous un répertoire de travail (par exemple : `~/formationlinux/bash`) dans lequel vous créerez vos scripts. Écrivez un premier script `hello.sh` qui affiche "Hello world !" et "How are you today ?" et executez-le.
- **10.2** - Dans des variables différentes, récupérez des informations comme :
    - le nom de la distribution (via `/etc/os-release`)
    - le nombre d'utilisateurs (différents) actuellement loggé au système (via who)
    - la quantité de RAM totale et utilisée (voir `free -h`)
- 10.3 - Relancer le script avec `bash -x votrescript.sh` et analyser ce qui s'affiche : cette commande est utile pour débugger ce qu'il se passe dans un script !
- 10.4 - En reprenant les codes couleurs étudiés en partie 8, définissez des variables de couleur comme `PURPLE` qui vaut `\033[35m`. Modifier le code de la question 10.1 pour affichez "How are you today ?" avec les couleurs de l'arc-en-ciel ! (Rappel : si il y a des couleurs, `echo` doit être appelé avec l'option `-e`)

## 10 partie 2 - paramétrabilité, interactivité

- 10.5 - Écrivez un script `test_args.sh` qui affiche le nom du script, le nombre d'argument donnés, ainsi que le premier et deuxième argument. Testez et validez en lançant par exemple `test_args.sh titi grosminet` et `test_args.sh pikachu carapuce`
- 10.6 - Écrivez un script `add.sh` qui **prends deux nombre en argument** en affiche le résultat de leur addition.
- 10.7 - Écrivez un script `age.sh` qui **demande interactivement** à l'utilisateur son année de naissance, puis calcule et affiche son âge. 
- **10.8** - Créez un script `check_user.sh`. Il est destiné à être lancé par `root` pour s'assurer qu'un utilisateur donné ne fait pas n'importe quoi. Implémentez les étapes suivantes une par une, en les testant au fur et à mesure :
   - Le script **prend en argument** un nom d'utilisateur ;
   - Calculer l'espace disque occupé par le repertoire personnel de l'utilisateur (aidez-vous de `du -hs <repertoire>`). Afficher un message comme "Son repertoire personnel pèse X Mo".
   - (Bonus) Compter le nombre de processus actuellement lancés par cet utilisateur (aidez-vous de `ps au -u <user>`) et afficher un message comme "L'utilisateur a X procesus en cours" ;
   - (Bonus) Même chose, mais avec le nombre de terminaux actuellement utilisés par l'utilisateur ;

## 10 partie 3 - les conditions

- **10.12** - Reprendre le script `age.sh` de l'énoncé 10.7. Vérifiez que l'année de naissance fait sens. Par exemple, si elle est inférieure à 1900, on pourra afficher "Hmm... T'es sur !?", et si l'année donnée est supérieure à 2020, on pourra afficher "Tu viens du futur !?". Dans les deux cas, on quittera le programme **en renvoyant un code d'erreur.** (code de retour différent de 0)
- 10.13 - En reprenant `check_user.sh` :
    - ajouter un test que l'utilisateur existe en vérifiant qu'il y a bien une ligne correspondante dans `/etc/passwd` (ou un autre moyen de votre choix), sinon afficher un message d'erreur (dans stderr !) et arrêter le script avec `exit` en renvoyant le code de retour `1` ;
    - adaptez le comportement du script de sorte à ce que `./check_user.sh --help` (ou `-h`) affichera (au lieu du fonctionnement normal de la fonction) une courte description de ce que fait le script et de comment l'utiliser.
    - ajoutez des tests de sorte que le script râlera si il se trouve que le répertoire personnel dépasse une certaine taille
    - (bonus) ajoutez des tests de sorte que le script râlera si il se trouve que l'utilisateur a lancé plus que 50 processus, et/ou plus que 5 terminaux.

## 10 partie 4 - les fonctions

- 10.14 - Comme en 10.4, créer un script `utils.sh` qui défini des variables correspondant aux couleurs. À l'aide de celles-ci, implémentez et testez au fur à mesure les fonctions suivantes :
    - `success` qui prends un message en argument et affiche `"[ OK ] Le message"` avec le mot `OK` en vert ;
    - `info`    qui prends un message en argument et affiche `"[INFO] Le message"` avec le mot `INFO` en bleu ;
    - `warning` qui prends un message en argument et affiche *dans la sortie d'erreur* `"[WARN] Le message"` avec le mot `WARN` en orange ;
    - `error`   qui prends un message en argument et affiche *dans la sortie d'erreur* `"[FAIL] Le message"` avec le mot `FAIL` en rouge ;
    - `critical` qui prends un message en argument et affiche *dans la sortie d'erreur* `"[CRIT] Le message"` avec le mot `CRIT` en rouge, **et termine directement le script avec un code de retour de 1**.
- 10.15 - Dupliquez le script `check_user.sh` de la question 10.8 (la copie peut s'appeler `check_user_v2.sh`), puis transformez les différentes parties du script en fonctions. Ce genre de travail s'appelle *(re)factoriser du code*.  **Testez vos modifications au fur et à mesure !**
    - au début (après le `#!/bin/bash`), ajoutez `source utils.sh` pour charger les fonctions définies dans `utils.sh` dans ce script.
    - introduisez une fonction `assert_user_exists` qui affichera une erreur et arrêtera le script (via `critical`) si l'utilisateur n'existe pas ;
    - introduisez une fonction `usage` qui sera appelée pour décrire le fonctionnement du script si appelé avec `--help` ou `-h` ;
    - introduisez une fonction `check_home_usage` qui vérifiera que la taille du home de l'utilisateur ne dépasse pas un certain seuil. Si le nombre n'est pas trop grand, affichez le nombre avec `info` - ou bien avec `warn` sinon.
    - de façon similaire, une fonction `check_terminals`
    - de façom similaire, une fonction `check_processes`
- 10.16 - Finalement, adaptez le script pour qu'il affiche à la fin que tout va bien avec `success` si aucun problème n'a été détecté, ou `fail` pour signifier que l'utilisateur a dépassé les bornes des limites !

## 10 partie 5 - les boucles

- 10.17 - Écrivez à l'aide d'une boucle `for` un script qui compte 2 par 2 jusqu'à 100.
- 10.18 - Même chose, mais à l'aide d'une boucle `while`.
- 10.19 - En reprenant le script `check_user.sh`, utilisez une boucle `for` pour lancer ce script sur tous les utilisateurs ayant `/bin/bash` comme shell.
- 10.20 - Écrivez un script `confirm.sh` qui, à l'aide d'une boucle `while`, demande à l'utilisateur `Est-ce que tu es sur ? [oui/non]` tant qu'il n'a pas répondu `oui` ou `non`.
- 10.21 - Revenant d'un mariage dans votre famille, vous décidez de partager vos 100 photos avec le reste de votre famille. Sachant que vos appareil photo dernier-cri prends des photos en moulte-méga-pixels qui pèsent 10 Mo chacune, vous décidez qu'il faut mieux redimensionner les images avant de les envoyer pour ne pas surcharger les boîtes mails de tout le monde avec 1Go de photos. Pour ce faire, renseignez-vous sur la commande `convert` (du paquet ImageMagick) qui permet de redimensionner (ou *rescaler*) et éventuellement d'adapter le niveau de qualité. Sachant maintenant manipuler cette commande, écrivez une boucle `for` pour redimensionner d'un seul coup toutes les images `jpg` présentent dans le dossier courant. (Pour tester votre script, vous pouvez télécharger par exemple des images sur `pixabay.com`)
- 10.22 - Ecrire en bash un jeu qui consiste à demander à l'utilisateur de deviner un nombre choisi aléatoirement par le programme. L'utilisateur entrera un nombre, et le programme dira à l'utilisateur si le nombre à trouver est plus petit ou plus grand, jusqu'à ce que le bon nombre soit trouvé.
