# Linux, Administration avancée

## 1. Déploiement d'une application PHP/Mysql : Nextcloud

Dans cette partie, on se propose de déployer une application basée sur PHP /
Mysql, ce qui est un exemple classique d'application "dynamique" (c.f.
architecture LAMP).

Une telle installation implique typiquement les étapes suivantes :
- téléchargement de l'application et extraction dans le bon dossier
- installation de dépendances
- création de la base de donnée
- configuration du serveur web
- configuration de l'application
- test et finalisation de l'installation

Les instructions suivantes ne viennent pas de `/dev/urandom` : elles ont été
récupérée depuis le site officiel de Nextcloud (et aussi du script
d'installation de l'app YunoHost !).

- 1.1 - Télécharger l'archive de la dernière version de Nextcloud (c.f. lien
fourni sur Dismorphia). Décompresser l'archive à l'aide de `tar` et mettre son
contenu dans `/var/www/nextcloud`.

- 1.2 - Installer les dépendances de Nextcloud (c.f. liste fournie sur
Dismorphia). Vérifier qu'il y a bien un service `php7.0-fpm` et `mysql` (ou
`mariadb`) qui tourne désormais sur le serveur - à la fois via `systemctl` et
`ps`.

- 1.3 - Créez un utilisateur `nextcloud` et une base de donnée portant le même
nom. Pour ceci, il faut ouvrir une console mysql et utiliser les incantations
correspondantes (éventuellement, remplacez `password` par un vrai mot de passe)
(aussi : n'oubliez pas les `;` !)

```bash
$ mysql -u root
MariaDB [(none)]> CREATE USER 'nextcloud'@'localhost' 
                  IDENTIFIED BY 'password';
MariaDB [(none)]> CREATE DATABASE IF NOT EXISTS nextcloud;
MariaDB [(none)]> GRANT ALL PRIVILEGES ON nextcloud.*
                  TO 'nextcloud'@'localhost'
                  IDENTIFIED BY 'password';
MariaDB [(none)]> FLUSH privileges;
MariaDB [(none)]> quit
```

- 1.4 - Configurons maintenant Nextcloud pour utiliser la base de donnée qui
  vient d'être créée. Pour cela, rendez-vous dans `/var/www/nextcloud`.
  Assurez-vous qu'il existe un fichier `occ` dans ce dossier. Lancez ensuite
  la commande suivante (êtes-vous capable de comprendre le rôle de ses
  différents morceaux ?). Il vous faudra peut-être remplacer `password` par le
  mot de passe précédemment choisi.

```bash
$ php occ maintenance:install \
     --database      "mysql"     --database-name "nextcloud" \
     --database-user "nextcloud" --database-pass "password" \
     --admin-user    "admin"     --admin-pass    "password"
```

- 1.5 - Il nous aussi définir le domaine derrière lequel Nextcloud est hébergé :
éditez le fichier `config/config.php` de Nextcloud, et rajoutez votre nom de
domaine dans les "trusted domains". Ajoutez également le paramètre
`overwriteprotocol` avec la valeur `http`. (Pour ces deux manipulations, il
vous faudra essayer de deviner la syntaxe à partir du contenu déjà présent dans
le fichier ;))

- 1.6 - Configurons maintenant Nginx pour servir l'application Nextcloud. Pour
  cela, récupérer et étudiez le modèle de configuration (fourni sur Dismorphia).
  Il vous faudra ajouter ce modèle à votre configuration nginx, et remplacer 
  `__WEB_PATH__` et `__UNIX_FOLDER__` par des valeurs appropriée. (Ne remplacez
  pas toutes les occurrences à la main, utilisez un outil approprié !).
  Notez l'existence d'une ligne mentionnant `/var/run/php/php7.0-fpm.sock`. À
  votre avis, à quoi sert ce fichier et cette ligne ?

- 1.7 - Testez que la configuration nginx semble valide avec `nginx -t`,
  rechargez la configuration nginx et tentez d'accéder à votre application via
  un navigateur web. Si elle ne fonctionne pas correctement (c'est probable !),
  investiguez les logs d'erreur de nginx. Comparez les messages aux permissions
  de `/var/www/nextcloud`, et à l'utilisateur avec lequel tournent les processus
  `php-fpm`. Comment faut-il modifier les permissions pour que l'application 
  fonctionne correctement ?
  
- 1.8 - Une fois le problème résolu, tester que l'application fonctionne
  correctement et découvrir Nextcloud (téléversez des fichiers, créez des
  dossier, etc...). (Il est même possible d'installer une application Nextcloud
  sur votre smartphone pour synchroniser les fichiers !)

- 1.9 - Attendez que le formateur casse votre serveur à distance, puis
  investiguez les problèmes créé. Pour cela, il vous faut absolument regarder le
  status des services ainsi que les fichiers de logs dans `/var/log/` et ses
  sous-dossiers.


## 2. Utilisation de conteneurs Linux / LXC

- 2.1 - Installez LXD (et non LXC!) sur votre serveur avec la procédure suivante :

```bash
# Mettre à jour la liste des paquets disponibles sur le dépots
$ apt update

# LXD n'est pas disponible dans Debian pour le moment. On utilise un outil
# qui s'apelle snapd..
$ apt install snapd
$ . /etc/profile.d/apps-bin-path.sh # Propager l'installation de snapd...

# Installer et initialiser LXD
$ snap install lxd
$ lxd init
# ... pendant l'installation, garder les valeurs par défaut
```

- 2.2 - Pour votre culture générale, regarder la liste des images LXC
  disponibles à l'aide de `list image list images:`

- 2.3 - Déployez un premier LXC Debian Stretch avec `lxc launch
  images:debian/stretch myfirstlxc`. (Vous pouvez décider d'appeler votre LXC
  autrement que `myfirstlxc`). Grâce à `lxc list`, identifiez l'IPv4 locale de
  ce LXC. Etudiez également les processus correspondant à votre LXC avec `ps`
  (et `--forest` !).

- 2.4 - Il est possible de lancer des commandes dans votre LXC grâce à `lxc exec
  <nom_de_votre_lxc> -- commande`. En particulier, il est possible d'ouvrir un
  shell à l'intérieur de votre LXC avec `lxc exec <nom_de_votre_lxc> --
  /bin/bash`. À l'aide de ceci, de la même façon que dans la partie 7 de la
  semaine précédente, déployez un serveur nginx à l'intérieur de votre LXC, qui
  servira une page web affichant "Hello world" avec une image de chaton (ou
  autre). Finalement, sur le nginx **de l'hôte**, ajoutez une location (par
  exemple `/my_first_lxc`) qui transferera les requêtes à votre LXC en utilisant
  `proxy_pass`. **En faisant toutes ces opérations, notez soigneusement les
  différentes étapes que vous réalisez, l'objectif étant ensuite d'automatiser
  tout cela !**

- 2.5 - Détruisez (!) votre LXC à l'aide de `lxc delete`. Transformez votre
  travail de la question 2.4 en un script qui supprime le LXC si il existe déjà, 
  créer un nouveau LXC, déploie nginx, ajoute une page web contenant une image 
  de chaton et l'IP de la machine, et configure nginx de manière adéquate.

- 2.6 - Ajoutez un argument à votre script qui correspond à l'image de chaton
  à utiliser, et un autre correspondant au nom de la `location` à laquelle le
  LXC sera lié dans le nginx de l'hôte.  Votre script devra ainsi s'occuper de
  configurer le nginx de l'hôte, c'est-à-dire ajouter le bloc `location` et
  l'instruction `proxy_pass` adéquate. (Pour cela, il pourra vous être utile
  de modulariser la configuration nginx de l'hôte avec l'instruction
  `include`). Validez votre script en déployant trois LXC différent accessible
  via `/chaton1`, `/chaton2` et `/chaton3` de la manière suivante :

```bash
./deploy_lxc.sh chaton1.jpg /chaton1
./deploy_lxc.sh chaton2.jpg /chaton2
./deploy_lxc.sh chaton3.jpg /chaton3
```

## 3. Découverte de YunoHost

- 3.0 - Avant de continuer, il convient de supprimer (ou déplacer ailleur) le
  dossier `/var/www/nextcloud` et le fichier `/etc/nginx/sites-available/default`.

- 3.1 - Sur votre serveur, téléchargez le script d'installation de YunoHost sur
  `https://install.yunohost.org/` et lancez-le avec `bash le_script.sh`.
  L'installation étant terminée, lancez la postinstallation avec `yunohost tools
  postinstall`. Le domaine principal correspond au domaine de votre serveur. Il
  vous faudra également choisir un mot de passe administrateur.

- 3.2 - Créez un premier utilisateur avec `yunohost user create <identifiant>`.
  Pour l'adresse email demandée, il est classique de choisir quelque chose comme
  `identifiant@votre.domaine.tld`.



