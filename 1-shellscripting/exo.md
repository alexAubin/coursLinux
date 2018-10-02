# Feuille d'exercices n.2

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

## 9 partie 1 - redirections et assemblages

- 9.1 - Créer un fichier à l'aide de `echo` et d'une redirection
- 9.2 - Sur un petit écran, inspecter la liste des fichier de `/usr/bin` avec `ls` n'est pas pratique, car la sortie est trop longue. Pour contourner le probleme, enregistrez la sortie dans un fichier puis lisez-là avec `less`. 
- 9.3 - En **une seule ligne de commande** : créer un dossier `dev` dans votre répertoire personnel, puis créer un sous-dossier `bash`, et dedans un fichier `intro` qui contient "Je fais du bash, c'est stylé !"
- 9.4 - Écrire **une seule ligne de commande** qui affichera (juste) "J'ai le droit" ou "J'ai pas le droit" si il vous est possible de lister le contenu du dossier `/root` (répeter l'expérience sur d'autres dossiers)
- 9.5 - `bc` est un utilitaire permettant de faire de petit calculs. Testez `bc` en mode interactif pour faire quelques additions (Ctrl+D pour quitter). Mettez maintenant une suite de calcul dans un fichier, que vous injecterez directement dans `bc`. Enfin, faites des calculs similaire mais en injectant directement une chaine dans `bc`.
- 9.6 - `curl` est un utilitaire qui permet de telecharger et le code source d'une page (par exemple, fr.wikipedia.org) dans la console. 
    - Comment pouvez-vous faire pour sauvegarder cette page dans un fichier ? 
    - Retentez l'expérience avec une adresse qui n'existe pas, et modifiez votre commande pour supprimer les erreurs mais afficher tout de même "Ca n'a pas marché" dans le cas où vous tentez de télécharger une page qui n'existe pas...
- 9.7 Créez un fichier `/tmp/chat` dans lequel padawan et r2d2 peuvent tous les deux écrire. Renseignez-vous sur l'option `-f` de la commande `tail` puis :
    - Lancez `tail -f /tmp/chat` en tâche de fond dans deux terminaux (l'un de padawan, l'autre de r2d2) ;
    - À l'aide de redirections, envoyez des messages dans le fichier `/tmp/chat` et observez les deux terminaux ;
    - Améliorez le système en créant un alias `say` qui affiche un message préfixé de votre nom d'utilisateur (ex: [r2d2] beep boop).
    
## 9 partie 2 - pipes et boîte à outils

- 9.8 - Si ce n'est pas deja le cas, ajoutez un alias pour activer automatiquement `--color=auto` chaque fois que la commande `grep` est utilisée. Essayez quelque manipulation avec `grep` pour confirmer que les occurences trouvées sont bien mises en valeur.
- 9.9 - Lister les lignes de `/etc/passwd` qui correspondent aux utilisateurs ayant `/bin/bash` comme shell de login
- 9.10 - Meme chose, mais cette fois en affichant uniquement le nom des utilisateurs
- 9.11 - Lister les utilisateurs (uniquement leur nom !) qui ont comme shell de login `nologin`
- 9.12 - lister les utilisateurs (uniquement leur nom) qui ont un mot de passe non vide
- 9.13 - Affichez le contenu de `/etc/login.defs` sans les commentaires
- 9.14 - Ecrivez un alias `canisudo` qui vérifie que vous êtes dans le groupe sudo
- 9.15 - En analysant les options de `grep`, trouvez un moyen de lister toutes les occurences du mot `daemon` dans `/etc/`
- 9.16 - Sachant que pour grep, `^`et `$` désignent un début et une fin de ligne, pouvez-vous affichez le contenu de `/etc/login.defs` sans les lignes vides, puis sans les lignes vides ni les commentaires ?
- 9.17 - Écrivez une ligne de commande qui affiche "Oui" ou "Non" si r2d2 est actuellement loggué. On pourra pour ce faire utiliser (entre autre chose) le fait que `grep` a un code de retour, et eventuellement l'option `-q`.
- 9.18 - À l'aide de `ps`, `sort` et `uniq` générer un bilan du nombre de processus actuellement en cours par utilisateur
- 9.19 - À l'aide de `sort` et `uniq`, analysez le fichier `loginattemps.log`, et produisez un résumé du nombre de tentative de connections par ip
- 9.20 - Construisez une ligne de commande qui récupère les adresses des images présentes dans le code du site `yolowag.team`. Vous aurez possiblement besoin de `curl`, `grep`, `tr` et `awk` (eventuellement de `sed`).

