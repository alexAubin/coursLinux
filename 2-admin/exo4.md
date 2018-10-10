# Administration Linux - feuille d'exercice n.4

## 6 - Services et sécurité basique d'un serveur

- 6.1 - Sur votre serveur, identifiez le processus `sshd` dans la liste des processus, et vérifiez le status du service "sshd".
- 6.2 - Interdisons à root de se logguer en ssh en utilisant un mot de passe. Pour ce faire, :
    - ouvrir le fichier `/etc/ssh/sshd_config` et changer la valeur de `PermitRootLogin` de `yes` à `prohibit-password`. (Attention à ne pas faire d'erreur de syntaxe !). Dans un contexte réel, nous aurions directement mis ce paramètre à `no`, mais le formateur a besoin de pouvoir encore se connecter en root via un clef - nous desactivons donc ici juste le login par mot de passe !
    - recharger ensuite le service `ssh` à l'aide de `systemctl reload sshd`
    - refaire un `systemctl status sshd` pour confirmer que le service a bien été rechargé
    - connaissant le mot de passe, tentez depuis un autre terminal d'ouvrir une nouvelle connexion ssh en root. Y arrivez-vous ? Est-ce normal ?
- 6.3 - Étudiez le fichier de log `/var/log/auth.log`, et notamment les lignes concernant `sshd`. 
    - à quoi correspondent ces lignes ? 
    - à l'aide de `whois`, renseignez-vous sur quelques-une des IP liée à des tentatives de connections échouées - et en particulier celles avec des IP ne correspondant pas au centre de formation.
- 6.4 - Installons un service qui bloquera ces tentatives répétées de brute-forcer le mot de passe. Fail2ban est un tel service qui analyse en permanence certains fichier de log pour déclencher automatiquement des actions (e.g. bannir une ip pour un certain temps)
    - installez le programme / service `fail2ban` ;
    - vérifiez qu'il existe désormais un service `fail2ban` actif ;
    - étudiez le fichier `/etc/fail2ban/jail.conf` et en particulier à quoi correspondent les réglages `bantime`, `findtime` et `maxretry` ;
    - étudiez le contenu de `/var/log/fail2ban.log` ;
    - modifiez les paramètres de `bantime`, `findtime` et `maxretry`. Par exemple, diminuez `maxretry` à 3 et augmentez `findtime` à 1800 ;
    - rechargez le service avec `systemctl reload fail2ban`
    - demandez à un camarade d'essayer de se connecter (en vain, et sans connaitre le mot de passe) à votre serveur **depuis son serveur à lui/elle** (_pas depuis le centre de formation !_). Observer avec lui/elle ce qui se produit dans sa console et dans le fichier de log `/var/log/fail2ban.log`
- 6.5 - Finalement, installons un firewall nommé `ufw` pour contrôler explicitement quels ports sont ouverts
    - installer `ufw` ;
    - vérifier que le firewall est pour le moment inactif avec `ufw status` ;
    - par défaut, autorisons toutes les connections sortantes mais interdisons toutes connection entrante. Pour cela, utiliser `ufw default deny incoming` et `ufw default allow outgoing` ;
    - autorisons le cas particulier de ssh, en terme de connection entrante : `ufw allow ssh` (ou plus explicitement si vous le souhaitez : `ufw allow 22/tcp` !) ;
    - activer le firewall avec `ufw enable` et vérifier le status avec `ufw status verbose`. 
- 6.6 - Est-ce une bonne idée de stopper le service `sshd` ?

## 7 - Installer et configurer un serveur web

- 7.1 - Installer `nginx` puis vérifier que le service tourne bien avec `systemctl status nginx`. On pourra aussi utiliser `ps -ef --forest` pour constater qu'un processus nginx tourne bien, ainsi que `netstat -tulpn` pour constater qu'il écoute bien sur le port 80.
- 7.2 - Tester d'accéder à votre serveur depuis un navigateur web. Que se passe-t-il ? En déduire qu'il faut taper `ufw allow 80/tcp` - puis retenter l'opération. Comparez la page alors obtenue au fichier se trouvant dans `/var/www/html/`.
- 7.3 - Nous voudrions maintenant servir notre propre contenu web plutôt que l'exemple de nginx. Créer un dossier `mywebsite` dans `/var/www/` et à l'intérier, créer un fichier `index.html` qui contient par exemple :

```html
<html>
Hello world !
</html>
```

Ensuite, modifier le fichier `/etc/nginx/sites-enabled/default` :  trouvez l'instruction à modifier pour servir le dossier `/var/www/mywebsite/` plutôt que `/var/www/html/`. Vérifiez ensuite que vos changements ne causent pas de problèmes grâce à `nginx -t`, puis si tout est ok, recharger le service avec `systemctl reload nginx`. Arrivez-vous maintenant à accéder à votre page web ?
- 7.4 - Modifier votre page web pour inclure une image (se renseigner sur la balise HTML `<img>`). Par exemple, des images de chatons peuvent être trouvées sur `https://placekitten.com/` et téléchargée sur le serveur à l'aide de la commande `wget`.
- 7.5 - Rendez-vous dans `/var/log/nginx/` et lancer une surveillance du log `access.log` à l'aide de `tail -f access.log`. Depuis votre navigateur, rechargez plusieurs fois la page de votre site et étudiez les lignes qui apparaissent dans votre console.
- 7.6 - Continuez de personnaliser votre page web. Par exemple, rajoutez un lien vers une autre page web se situant dans un sous-dossier de `mywebsite`.
- 7.7 - Depuis une session screen, rendez-vous dans le home de votre utilisateur. Assurez-vous que quelques fichiers existent dedans (par exemple, au moins un .bashrc ?). Depuis ce home, lancez alors `python -m SimpleHTTPServer 8000`. Ceci lance un programme python qui sert les fichiers du home sur le port 8000. Il nous faut ensuite lier ce programme avec nginx. Réouvrez `/etc/nginx/sites-enabled/default` et, après le bloc `location / { ... }`, rajoutez un bloc : 

```text
	location /my_user_home {
		proxy_pass http://127.0.0.1:8000/;
	}
```

Tester votre configuration avec `nginx -t`, rechargez le service avec `systemctl reload nginx`, puis testez d'accéder à ce nouveau chemin `/my_user_home`.
- 7.8 - Que se passe-t-il si vous arrêter nginx avec `systemctl stop nginx` ?

