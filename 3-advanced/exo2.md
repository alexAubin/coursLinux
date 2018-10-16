# Linux, Administration avancée, fiche n.2

## 3. Découverte de YunoHost

- 3.0 - Avant de continuer, il faut demander au formateur de recréer votre serveur (les modifications des modules précédent étant incompatibles avec l'installation de YunoHost)

- 3.1 - Sur votre serveur, téléchargez le script d'installation de YunoHost sur
  `https://install.yunohost.org/` et lancez-le avec `bash le_script.sh`.
  L'installation étant terminée, lancez la postinstallation avec `yunohost tools
  postinstall`. Le domaine principal correspond au domaine de votre serveur. Il
  vous faudra également choisir un mot de passe administrateur.

- 3.2 - Créez un premier utilisateur avec `yunohost user create <identifiant>`.
  Pour l'adresse email demandée <small>(N.B. : il s'agit d'une adresse qui sera créée, pas d'une adresse déjà existante !)</small>, il est classique de choisir quelque chose comme  `identifiant@votre.domaine.tld`.

- 3.3 - Installez l'application Nextcloud avec `yunohost app install nextcloud --debug`. (L'option `--debug` vous permet de visualiser les différentes instructions d'installation en temps réel.). Pour tester que l'application fonctionne, il vous faudra probablement accepter un certificat HTTPS non reconnu (et donc ajouter l'exception correspondante). Il vous faudra peut-être également passer par le portail utilisateur où le login/motdepasse de l'utilisateur sera demandé.

- 3.4 - Via l'interface d'administration web cette fois (accessible via `https://votre.domain.tld/yunohost/admin`), installez et testez l'application h5ai. Pour cela, il faudra aller dans `Applications`, `Install`, puis tout en bas installer une application via une URL personnalisée qui dans le cas présent est `https://github.com/YunoHost-Apps/h5ai_ynh`. Testez l'application, puis identifiez où sont stockés les documents rendu accessibles par cette application.

- 3.5 - Dans l'interface web, récupérez la configuration DNS recommandée pour votre serveur. Propagez les sections "basic" et "mail" (ignorez celle sur XMPP) dans l'interface de gestion de votre domaine sur `netlib.re`. Une fois cela réalisé, testez la "spaminess" de vos emails avec `mail-tester.com`. (Attention, vous n'avez le droit qu'à trois essais !)

- 3.6 - Dans Thunderbird (client mail de bureau, normalement installé dans Linux Mint par défaut), ajoutez un compte mail correspondant à votre utilisateur. Vous devriez constater que votre adresse à déjà reçue des emails ! Tentez ensuite d'envoyer un mail à l'un de vos camarade ayant aussi configuré son Thunderbird avec son propre domaine. Si les mails mettent plus que quelques secondes à arriver, vérifiez les logs `/var/log/mail.info` et la commande `mailq`.

## 4. Boucles `for` et `while`

- 4.1 - Écrivez à l'aide d'une boucle `for` un script qui compte 2 par 2 jusqu'à 100 !

- 4.2 - Même chose, mais à l'aide d'une boucle `while`.

- 4.3 - En reprenant le script `check_user.sh` de la fin de la première semaine, utilisez une boucle `for` pour lancer ce script sur tous les utilisateurs ayant `/bin/bash` comme shell de login.

- 4.4 - Écrivez un script `confirm.sh` qui, à l'aide d'une boucle `while`, demande à l'utilisateur `Est-ce que tu es sur ? [oui/non]` tant qu'il n'a pas répondu oui ou non.

- 4.5 - Revenant du mariage de votre tante ou cousine, vous décidez de partager vos 100 photos avec le reste de votre famille. Sachant que vos appareil photo dernier-cri prends des photos en moulte-méga-pixels qui pèsent 10 Mo chacune, vous décidez qu'il faut mieux redimensionner les images avant de les envoyer pour ne pas surcharger les boîtes mails de tout le monde avec 1Go de photos. Pour ce faire, renseignez-vous sur la commande `convert` (du paquet ImageMagick) qui permet de redimensionner (ou *rescaler*) et éventuellement d'adapter le niveau de qualité. Sachant maintenant manipuler cette commande, écrivez une boucle `for` pour redimenssionner d'un seul coup toutes les images `jpg` présentent dans le dossier courant. (Pour tester votre script, vous pouvez télécharger par exemple des images sur `pixabay.com`)

- 4.6 - Ecrire en bash un jeu qui consiste à demander à l'utilisateur de deviner un nombre choisi aléatoirement par le programme. L'utilisateur entrera un nombre, et le programme dira à l'utilisateur si le nombre à trouver est plus petit ou plus grand, jusqu'à ce que le bon nombre soit trouvé.
