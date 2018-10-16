title: Administration avancée
class: animation-fade
layout: true

---

class: impact

# Administration Linux avancée

---

.center[
![](img/previously.jpg)
]

---

# Recap'

- Installer une distribution
- Le gestionnaire de paquet
- Notions de réseau
- Notion de chiffrement
- Administrer à distance avec SSH
- Gérer des services
- Notions de sécurité
- Installer un serveur web
- Automatiser des tâches avec des jobs Cron

---

class: impact

# Recap'

### (tentative de représentation)

---

.center[
![](img/1.png)
]

---

.center[
![](img/2.png)
]

---

.center[
![](img/3.png)
]

---

.center[
![](img/4.png)
]

---

.center[
![](img/5.png)
]

---

.center[
![](img/6.png)
]

---

.center[
![](img/7.png)
]

---

.center[
![](img/8.png)
]

---

# Objectifs de ces trois derniers jours

- Consolider la manipulation de la CLI, de SSH
- ... et la compréhension du réseau, des services
- Vous montrer d'autres possibilités dans l'écosystème d'un serveur
    - PHP / Mysql
    - LXC
    - Ecosystème "complet" avec YunoHost
- Amorcer l'aspect 'DevOps' (transition avec toutes les autres technos de la formation !)

---

# Plan

- 0 - (Finir monitoring.html ?)
- 1 - Déployer une application PHP/Mysql
- (1.5 - Investiguer des problèmes)
- 2 - Introduction aux LXC
- 3 - Introduction à YunoHost
- 4 - (Moar Shell Scripting !? Boucles for/while)

---

# Ce dont je ne parlerais pas

- Créer des services systemd
- HTTPS / Certificats SSL...
- Gérer des sauvegardes
- Vim
- ...?

---

class: impact

# 1. Déployer une app PHP/Mysql

---

# 1. Déployer une app PHP/Mysql

- Jusqu'ici : des pages statiques !

.center[
![](img/8.png)
]

---

# 1. Déployer une app PHP/Mysql

Comment créer des pages "dynamiques", par exemple :
- espaces utilisateurs <small>(mur facebook, compte amazon)</small>
- compte genéré via des données variables <small>(cours de bourse, ...)</small>
- ... ou stockées dans des bases de donnée <small>(liste d'élèves d'une université...)</small> 
- ...

"Bricolage" : cron job qui rafraìchit la page toutes les minutes

---

# 1. Déployer une app PHP/Mysql

## Methode générale / versatile / "moderne"

- Reverse-proxy (c.f. `proxy_pass`)

.center[
![](img/proxypass.png)
]

---

# 1. Déployer une app PHP/Mysql

## Historiquement / classiquement : PHP

- Le serveur web transmet la requête à un programme / daemon PHP
- PHP interprête le code et genere la réponse
- .. et renvoie la réponse à nginx qui la renvoie au client
- PHP est la "Gateway" dans le contexte de Nginx
    - c.f. 502 Bad Gateway, et 504 Gateway Timeout

---

# 1. Déployer une app PHP/Mysql

## et aussi : MySQL

- MySQL est classiquement utilisé pour gérer des bases de données
- Les données sont structurées de façon cohérente pour être accédées de manière efficace
- Interface avec PHP qui peut venir piocher dyaniquement des données
- PHP / L'app met ensuite en forme ces données pour générer la page

<br>

- N.B. : MariaDB est un fork du MySQL originel
- Alternatives à MySQL/MariaDB : PostgreSQL

---

.center[
![](img/nextcloud.png)
]

---

# 1. Déployer une app PHP/Mysql

## Nextcloud

.center[
![](img/nextcloud-logo.jpg)
]

---

# 1. Déployer une app PHP/Mysql

## Nextcloud

- Un logiciel libre, auto-hébergeable
- Stockage et synchronisation de fichiers sur un serveur
   - (similaire à Google Drive, Dropbox, )
- Basé sur PHP / MySQL

<br>

- Et aussi : calendrier, contacts, et pleins de modules variés


---

# 1. Déployer une app PHP/Mysql

## Nextcloud

.center[
![](img/nextcloud-interface.png)
]

---

# 1. Déployer une app PHP/Mysql

## Nextcloud : procédure d'installation

- Télécharger (et décompresser) les sources
- (Configurer PHP)
- Créer une base de donnée MySQL
- Configurer Nginx
- Configurer l'application
- Tester et valider

---

class: impact

# 1.5. Investiguer et réparer des problèmes

---

# 1.5. Investiguer et réparer des problèmes

## Méthode générale

- Comprendre que le deboggage fait partie du job !
- Être attentif, méthodique
- Chercher et consulter les logs...
   - ... et lire les messages attentivement !
- Comparer les messages à ce que l'on vient de faire, identifier à quel niveau se situe le problème ...
- Chercher des infos sur Internet ...
  - avec des mots clefs approprié

---

# 1.5. Investiguer et réparer des problèmes

## Méthode générale

Malheureusement ...

- Logs pas forcément trouvable (ou alors messages abscons)
- Demande un peu d'expérience pour savoir quoi / où chercher ...

---

# 1.5. Investiguer et réparer des problèmes

## Sources d'information

Savoir lire des posts sur Stack Overflow et ses dérivés :
- Stack Overflow (développement / programmation)
- Super User (administration système géneraliste / amateur)
- Server Fault (contexte pro., e.g. maintenance de serveur)

---

class: impact

# 2 - Introduction aux LXC

---

# 2 - Introduction aux LXC

## Jusqu'ici : machines virtuelle

- Une machine entière simulée dans une autre machine
- Bonne isolation
- Ressources "garanties", allouées explicitement à la VM
- "Lourd" en terme de taille (plusieurs Go) et performances

---

.center[
![](img/toodamnhigh.png)
]

---

# 2 - Introduction aux LXC

## Généralités sur la conteneurisation

La conteneurisation permet :
- de créer des systèmes isolés, similaire à des VM
- mais qui partagent un kernel commun ... !
- <small>(et potentiellement des fichiers commun)</small>
- ⇒ système léger (taille et perf), déployable rapidement, "jetable"
- (mais : ressources partagées, non garanties)

---

.center[
![](img/vm_vs_containers.png)
]

---

# 2 - Introduction aux LXC

## Généralités sur les LXC

- Technologie de conteneurisation de Linux
    - <small>(c.f. fonctionnalité du kernel, les cgroups)</small>
- Relativement récent !
    - V1.0 date de début 2014 ! 
    - V3.0 cette année
- À l'intérieur : un mini-système complet

---

.center[
![](img/lxc.png)
]

---

# 2 - Introduction aux LXC

## "Vanilla" LXC

`apt install lxc` puis utilisation des commandes `lxc-<stuff>`

## LXD !

- "Hyperviseur" pour gérer des LXC
- UX bien meilleure (commande `lxc <stuff>` (et non `lxd` !))
- Développé par Canonical (c.f. Ubuntu)

---

```
Usage:
  lxc [command]

Available Commands:
  config      Manage container and server configuration options
  delete      Delete containers and snapshots
  exec        Execute commands in containers
  file        Manage files in containers
  image       Manage images
  info        Show container or server information
  launch      Create and start containers from images
  list        List containers
  snapshot    Create container snapshots
  start       Start containers
  stop        Stop containers
```

---

# 2 - Introduction aux LXC

## Creer un LXC (1/2)

- De nombreuse images de systeme disponible

```bash
$ lxc image list images:
+--------------+----------+
|       ALIAS  |   SIZE   |
+--------------+----------+
| alpine/3.8   | 2.34MB   |
| archlinux    | 137.20MB |
| centos/7     | 83.47MB  |
| debian/10    | 122.36MB |
| fedora/28    | 60.40MB  |
| gentoo       | 242.96MB |
| ubuntu/18.10 | 124.88MB |
+--------------+----------+
```

---

# 2 - Introduction aux LXC

## Creer un LXC (2/2)

```bash
$ lxc launch images:debian/stretch test1
Creating test1
Starting test1
```

---

# 2 - Introduction aux LXC

## Interagir avec un LXC (1/2)

```bash
$ lxc exec text1 -- ps -ef --forest
UID      PID  CMD
root     103  ps -ef --forest
root       1  /sbin/init
root      32  /lib/systemd/systemd-journald
systemd+  39  /lib/systemd/systemd-networkd
root      53  /lib/systemd/systemd-logind
message+  55  /usr/bin/dbus-daemon --system
root      80  /sbin/dhclient -4 -v -pf /run/
systemd+  94  /lib/systemd/systemd-resolved
root      95  /sbin/agetty --noclear --keep-
```

---

# 2 - Introduction aux LXC

## Interagir avec un LXC (2/2)

```bash
root@scw-32c380:~$ lxc exec stretch1 -- /bin/bash
root@stretch1:~$       # <<< Dans le LXC !
```

```bash
root@scw-32c380:~$ lxc console stretch1
To detach from the console, press: <ctrl>+a q
                                             
Debian GNU/Linux 9 stretch1 console

stretch1 login:
```

---

# 2 - Introduction aux LXC

## I can haz internetz ?

- Les LXC sont sur un réseau local, via `lxcbr0`

```
$ lxc list
+----------------+---------+------------------+
|      NAME      |  STATE  |     IPV4         |
+----------------+---------+------------------+
| saperlipopette | RUNNING | 10.0.0.51 (eth0) |
| veganaise      | RUNNING | 10.0.0.32 (eth0) |
| vinaigrette    | STOPPED |                  |
+----------------+---------+------------------+
```

---

# 2 - Introduction aux LXC

## Push / pull files

```bash
# Envoyer un fichier sur un LXC
$ lxc file push -- <fichier> <machine>/<destination>
# Recuperer un fichier dans un LXC
$ lxc file pull -- <machine>/<fichier> <destination>
```

Exemples :
```bash
$ lxc file push -- template.html test1/var/www
$ lxc file pull -- test1/var/log/auth.log test1.auth.log
```

---

# 2 - Introduction aux LXC

## Snapshots

- Il est possible de sauvegarder l'état d'un LXC pour le restaurer plus tard
- (ACHTUNG : Le LXC doit être *à l'arrêt !*)

```bash
$ lxc snapshot <container> <nom_du_snapshot>
```

---

.center[
![](img/lxc.png)
]

---

class: impact

# 3 - Introduction à YunoHost

---

# 3 - Introduction à YunoHost

Un outil pour **démocratiser l'auto-hébergement**
- héberger ses propres services
- réduire la barrière technique (et le coût en temps)

**Contextes** : domestique, associatif, PME

**Supports** : Carte ARM, vieux laptop, VPS, ...

**Déploiement d'outils "classiques"** : 
- synchronisation de fichier, de contacts, de calendrier
- blog, lecteur RSS, mail, messagerie instantannée
- tableau de tâche, ERP, ...
- ...?

---

# 3 - Introduction à YunoHost

D'un point de vue pratique
- gain de temps et d'énergie (déploiement et maintenance)
- principes de base de sécurité déjà implémenté
- garder le contrôle de ses données

D'un point de vue pédagogique
- écosystème "complet" : apps, mail, LDAP, IM, ..
- perspectives d'automatisation

---

# 3 - Introduction à YunoHost

## Aspect historique

- *kload* découvre l'adminsys et se rends compte que c'est galère
- Volonté de simplifier / automatiser
- Script qui font ce qu'un adminsys aurait fait "à la main"

.center[
![](img/dude_yunohost.jpg)
]

---

# 3 - Introduction à YunoHost

.center[
![](img/yunohost_logo.png)
]

- ![](img/icon-debian.png) Basé sur Debian
- ![](img/icon-tools.png) Administration en CLI ou via une gentille interface web
- ![](img/icon-package.png) Installation d'applications en quelques clics
- ![](img/icon-globe.png) ![](img/icon-lock.png)  Multi-domaines et intégration HTTPS (Let's Encrypt)
- ![](img/icon-users.png) ![](img/icon-door.png) Multi-utilisateurs avec portail "Single Sign On"
- ![](img/icon-mail.png) ![](img/icon-messaging.png) Stack mail complète + messagerie instantannée XMPP
- ![](img/icon-shield.png)  Sécurité (fail2ban, firewall)
- ![](img/icon-medic.png) Système de sauvegardes

---

# 3 - Introduction à YunoHost

## Multi-domaines

- Votre serveur peut héberger plusieurs domaines
   - par ex. `jean-dupont.com`
   - ... et `curling.alsace`

- Il est ensuite possible d'avoir des mails et des apps sur ces domaines
- En HTTPS ! (Certificats Let's Encrypt en quelques clics)

---

# 3 - Introduction à YunoHost

## Applications

.center[
![](img/apps.png)
]

---

# 3 - Introduction à YunoHost

.center[
![](img/zerobin.png)

ou bien : `yunohost app install zerobin`
]

---

# 3 - Introduction à YunoHost

## Applications

- L'installation fait "ce que vous auriez fait à la main"
- Une application peut être privée (réservée à certains utilisateurs)
- Intègre aussi la mise à jour et les backups
- ~20 apps officielles, ~100+ communautaires

---

# 3 - Introduction à YunoHost

## Utilisateurs 

- Multi-utilisateurs, "les vrais gens de la vraie vie"
- Portail utilisateur avec "Single Sign On" <small>(`votre.domaine.tld/yunohost/sso`)</small>
- Ils ont automatiquement une adresse mail (et un compte XMPP)

.center[
![](img/home_panel.jpg)
]

---

# 3 - Introduction à YunoHost

## Administration <small>(`votre.domaine.tld/yunohost/admin`)</small>

.center[
![](img/admin.png)
]

---

.center[
![](img/ecosystem.png)
]

---

.center[
![](img/yunohost.png)
]

---

.center[
![](img/portForwarding_fr.png)
]


---

class: impact

# 4 - Boucles `for` / `while`

---

# 4 - Boucles `for` / `while`

## Généralités sur les boucles

Répéter des instructions :
- sur une liste de valeurs / données (boucles `for`)
- ou tant qu'une condition est vraie (boucles `while`)

---

# 4 - Boucles `for` / `while`

## Boucle `for`

```bash
for I in $(seq 1 10)
do
    echo "I vaut $I"
done
```

```bash
I vaut 1
I vaut 2
I vaut 3
...
I vaut 10
```

---

# 4 - Boucles `for` / `while`

## Boucle `for`

```bash
for FILENAME in $(ls)
do
    cp "$FILENAME" "/home/alex/backups/${FILENAME}.bkp"
done
```

---

# 4 - Boucles `for` / `while`

## Boucle `for`

```bash
for USER in $(cat /etc/passwd | awk -F: '{print $1}')
do
   SHELL=$(grep "^$USER:" /etc/passwd | awk -F: '{print $7}')
   echo "L'user $USER a comme login de shell : $SHELL"
done
```

---

# 4 - Boucles `for` / `while`

## Boucle `while`

```bash
I=10
while [[ "$I" -ge 0 ]]
do
   echo "Maintenant I vaut $I"
   I=$(bc <<< "$I-1")
done
```

```
Maintenant I vaut 10
Maintenant I vaut 9
Maintenant I vaut 8
...
Maintenant I vaut 0
```

---

# 4 - Boucles `for` / `while`

## Boucle `while`

Tant qu'une condition est vérifiée ...

```bash
while [[ "$NUMBER" -ge 0 ]]
do
    echo "Donne un nombre négatif !"
    read NUMBER
done
echo "Bien ouej ! $NUMBER est effectivement un nombre négatif !"
```

---

# 4 - Boucles `for` / `while`

## Boucle `while`

```bash
while [[ -z "$(ip a | grep 'inet ' | awk '{print $2}' | grep -v '127.0.0.1')" ]]
do
   echo "Waiting ..."
   sleep 1
done
```

---

class: impact

# Notes finales

---

.center[
![](img/aplause.gif)
]

---

.center[
![](img/fantastic.gif)
]

---

.center[
![](img/tobecontinued.jpg)
]

---

- Git, Python
- BDD SQL / NoSQL 
- Apache
- Tomcat
- Junit, Jmeter, Gatling
- Logstach, Elastic Search, Kibana
- Nagios
- Scrum
- Devops
- Docker
- Jenkins
- Chef
- Puppet
- Ansible
- AWS, Openstack

---

.center[
![](img/thatsall.jpg)
]



