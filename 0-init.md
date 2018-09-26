title: Introduction à Linux
class: animation-fade
layout: true

---

class: impact

# {{title}}
*Become a Command Line Padawan in five days!*

---

class: impact

## Hello, world!

---

## À propos de moi

.col-4[
.center[
![](img/me.jpg)
]
]

.col-8[.center[
<br>
<br>
<br>
`https://github.com/alexAubin`
<br>
<br>
`alex.aubin@mailoo.org`
<br>
<br>
<br>
<br>
]]

.col-4[.center[
Ingénieur/Physicien
</br>
</br>
![](img/particles.jpg)
]]

.col-4[.center[
Dev / hacktiviste?

![](img/hackstub.jpg)
![](img/yunohost.jpg)
]]

.col-4[.center[
Formateur

![](img/python_arduino_linux.jpg)
]]

---

## À propos de vous

---

## Plan de la formation


(choix : approche technicienne)


---

## Logistique

## Evaluation

---

## Interagissez !

---

class: impact

## 0. Les origines de (GNU/)Linux 

### (ou plus largement de l'informatique contemporaine)

---

## 0. Les origines de Linux

### La préhistoire de l'informatique

- ~1940 : Ordinateurs electromecaniques, premiers ordinateurs programmables
- ~1950 : Transistors
- ~1960 : Circuits intégrés

.center[
...Expansion de l'informatique...
]

---

## 0. Les origines de Linux

### 1970 : UNIX

- Définition d'un 'standard' pour les OS 
- Un multi-utilisateur, multi-tâche
- Design modulaire, simple, élégant, efficace
- Adopté par les universités américaines
- Ouvert (évidemment)
- (Écrit en assembleur)

TOOD : insert carte des unix
TODO : insert PDP-7 ?
TODO : insert D. Ritchie, K. Thompson, B. Kernighan

---

## 0. Les origines de Linux

### 1975 : Le langage C

- D. Ritchie et K. Thompson définissent un nouveau langage : le C ;
- Le C rends portable les programmes ;
- Ils réécrivent une version d'UNIX en C, ce qui rends UNIX portable ;

---

## 0. Les origines de Linux

### 1970~1985 : Les débuts d'Internet

- Définition des protocoles IP et TCP
    - Faire communiquer les machines entre elles
    - Distribué / décentralisé : peut survivre à des attaques nucléaires
- ARPANET ...
- ... puis le "vrai" Internet
- Terminaux dans les grandes universités
- Appartition des newsgroup, ...

TOOD : carte ARPANET

---

## 0. Les origines de Linux

### 1980 : Le mouvement du logiciel libre et la culture hacker

- Le logiciel devient un enjeu commercial avec des licences propriétaires
- La culture hacker se développe dans les universités
    - Partage des connaisances
    - Transparence, détournement techniques
    - Contre les autorités centrales et la bureaucratie
    - Un mouvement technique, artistique et politique
- R. Stallman fonde le mouvement du logiciel libre et la Free Software Foundation (FSF)
    - 0. Liberté d'utiliser du programme
    - 1. Liberté d'étudier le fonctionnement du programme
    - 2. Liberté de modifier le programme
    - 3. Liberte de redistribuer les modificiations
- ... et le projet GNU
    - un ensemble de programmes libres

TODO : Stallman pic + GNU icon + dead cow 

---

## 0. Les origines de Linux

### 1990 : Création de Linux

I'm doing a (free) operating system (**just a hobby, won't be big and professional like gnu**) for 386(486) AT clones. This has been brewing since april, and is starting to get ready. I'd like any feedback on things people like/dislike in minix, as my OS resembles it somewhat (same physical layout of the file-system (due to practical reasons) among other things).

I've currently ported bash(1.08) and gcc(1.40), and things seem to work. This implies that I'll get something practical within a few months, and I'd like to know what features most people would want. Any suggestions are welcome, but I won't promise I'll implement them :-)

Linus (torvalds@kruuna.helsinki.fi)

PS. Yes - it's free of any minix code, and it has a multi-threaded fs. It is NOT portable (uses 386 task switching etc), and it probably never will support anything other than AT-harddisks, as that's all I have :-(.
— Linus Torvalds

---

## 0. Les origines de Linux

### Le succès de GNU/Linux

- Linus Torvalds met Linux sous licence GPL
- Support des processeurs Intel
- Système (kernel + programmes) libre et ouvert
- Compatibles avec de nombreux standard (POSIX, SystemV, BSD)
- Intègre des outils de développement (e.g. compilateurs C)
- Excellent support de TCP/IP

---

## 0. Les origines de Linux

.center[
... L'informatique et Internet se démocratisent ...
]

---

## 0. Les origines de Linux

### Linux aujourd'hui

- Très présent dans les routeurs, les serveurs et les smartphones
- Indépendant de tout constructeur
- Evolutif mais très stable
- Le système est fait pour être versatile et personnalisable selon on besoin
- Pratiques de sécurités beaucoup plus saines et claires que Microsoft

TODO : add pics de routeur, serveur, smartphone

---

## 0. Les origines de Linux

### Les distributions

Un ensemble de programmes "packagés", préconfigurés, intégré pour un usage ~précis ou suivant une philosophie particulière

- Debian : réputé très stable, typiquement utilisé pour les serveurs
- Ubuntu, Mint : grand public
- CentOS, RedHat : pour les besoins des entreprises
- Archlinux : un peu plus technicienne, très à jour avec les dernières version des logiciels
- Kali Linux : orientée sécurité et pentesting
- Android : pour l'embarqué (téléphone, tablette)
- YunoHost : auto-hébergement grand-public

Et bien d'autres : Gentoo, LinuxFromScratch, Fedora, OpenSuse, Slackware, Alpine, Devuan, elementaryOS, ...

TODO : add logos ?

---

## 0. Les origines de Linux

### Linux, les environnement

- Gnome
- Cinnamon, Mate
- KDE
- XFCE, LXDE
- Tiling managers (awesome, i3w, ...)

TODO : add pics ?

---

class: impact

## 1. Rappels sur l'informatique

---

class: impact

# « Informatique »

---

class: impact

## L'ordinateur comme outil universel

Votre laptop doit être pour vous ce que le sabre laser est au Jedi

---

## 1. Rappels sur l'informatique

### Architecture d'un ordinateur

TODO : schema

---

## 1. Rappels sur l'informatique

### Le rôle d'un OS

User
Programs
Operating System
Hardware

L'OS :
- sais communiquer avec le hardware pour exploiter les ressources
- créer des abstractions pour les programmes (e.g. fichiers)
- partage le temps de calcul entre les programmes
- s'assure que les opérations demandées sont légales

---

## 1. Rappels sur l'informatique

### Architecture d'Internet

- Décentralisé / distribué / "organique"
- Intelligence à l'extérieur

TODO : schema

---

## 1. Rappels sur l'informatique

### Architecture d'Internet

- IP : routage des paquets "au mieux"
- TCP : tunnel fiable pour communiquer (IP+accusés de réception)

---

## 1. Rappels sur l'informatique

### Architecture d'Internet

Le web : un protocole parmis d'autre pour échanger de l'information, dans un format précis (pages web)
Le mail : un autre protocole(s) pour échanger de l'information, dans un autre format (les courriers)

Autres protocoles : DNS, SSH, IRC, torrent, ...

---

## 1. Rappels sur l'informatique

### Architecture d'Internet

- Programmes
- Protocole
- TCP
- IP
- Cables

Modele client / serveur

---

class: impact

# 2. Prendre en main sa machine et le terminal

---

## 2. Prendre en main sa machine et le terminal

### Installer une machine virtuelle

- Un ordinateur "simulé" dans un ordinateur
- Choix : Debian Stretch, sans environnement graphique

---

## 2. Prendre en main sa machine et le terminal

### Observer le démarrage de la machine

---

## 2. Prendre en main sa machine et le terminal

### Se connecter

```
Debian Stretch <nom_de_machine> tty0

<nom_de_machine> login: █
```

---

## 2. Prendre en main sa machine et le terminal

### Se connecter

```
Debian Stretch <nom_de_machine> tty0

<nom_de_machine> login: votre_login
Password: █        # <<<< le mot de passe ne s'affiche pas du tout quand on le tape !
```

---

## 2. Prendre en main sa machine et le terminal

### Se connecter

```
Debian Stretch <nom_de_machine> tty0

<nom_de_machine> login: votre_login
Password: 
Last login: Wed 19 Sep 16:23:42 on tty2
votre_login@machine:~$ █
```

---

## 2. Prendre en main sa machine et le terminal

### Premières commandes

Changez votre mot de passe : 
- Taper `passwd` puis *Entrée* puis suivez les instructions

---

## 2. Prendre en main sa machine et le terminal

### Premières commandes

- Taper `pwd` puis *Entrée* et observer
- Taper `ls` puis *Entrée* et observer
- Taper `cd /var` puis *Entrée* et observer
- Taper `pwd` puis *Entrée* et observer
- Taper `ls` puis *Entrée* et observer
- Taper `ls -l` puis *Entrée* et observer
- Taper `echo 'Je suis dans la matrice'` puis *Entrée* et observer

---

## 2. Prendre en main sa machine et le terminal

### Discussion

- Nous nous sommes connecté à une machine
- Nous avons eu accès à un terminal
- Le terminal permet de taper des commandes pour interagir "directement" avec l'OS
- Des commandes comme dans "passer commande"
- Certaines affichent des choses, d'autres changent des états

---

class: impact

# 3. La ligne de commande

---

## 3. La ligne de commande

### Structure d'une commande

```
  evince  --fullscreen     presentation.pdf
   |     '------------'    '------------'
   |           |                      |
   v           v                      v
  nom       options              arguments
```

---

## 3. La ligne de commande

### Exemples

Une commande peut être simple :

```
cd
```

ou assez complexe :

```
dnsmasq -x /run/dnsmasq/dnsmasq.pid -u dnsmasq -7 /etc/dnsmasq.d,.dpkg-dist,.dpkg-old,.dpkg-new --local-service
```

---

## 3. La ligne de commande

### `passwd` - Changer son password

---

## 3. La ligne de commande

### `pwd` - Afficher le dossier courant

*Print current working directory*

---

## 3. La ligne de commande

### `ls` - Liste les fichiers d'un dossier

```
ls            # Liste les fichiers du repertoire courant
ls  /usr/bin  # Liste les fichiers du repertoire /usr/bin
ls  -a        # (ou --all) Liste les fichiers (y compris cachés)
ls  -l        # Avec des détails (type, permissions, proprio, date de modif)
ls  -t        # Trie par date de modification
ls  -h        # (ou --human-readable) Tailles lisibles comme '24K' ou '3G'
```

(on peut combiner les options et arguments)

---

## 3. La ligne de commande

### `cd` - Naviguer dans les dossiers

```
cd  /un/dossier   # Change de dossier courant
cd                # Revient dans le home
cd ..             # Remonte d'un dossier (par exemple /home si on était dans /home/alex)
cd -              # Retourne dans le dossier où on était juste avant
```

---

## 3. La ligne de commande

- Utiliser `ls` et `cd`, c'est comme naviguer avec un explorateur de fichier graphique !


- Un bon Jedi est toujours être attentif à :
    - où il est
    - ce qu'il cherche à faire
    - ce qu'il tape
    - ce que la machine renvoie

---

## 3. La ligne de commande

### Raccourcis et gestion des commandes

- Si une commande prends trop longtemps, il est possible de l'annuler avec [Ctrl]+C
- ([Ctrl]+C / [Ctrl]+V ne fais pas copier/coller dans la console !)
- [Tab] x1 permet d'autocompléter les noms de commande et les noms de fichier (si pas d'ambiguité)
- [Tab] x2 permet de suggérer les différentes possibilités
- Vous pouvez utiliser ↑ ou bien la commande `history` pour retrouver les commandes précédentes

---

#### Utilisez [Tab] 

---

### Utilisez [Tab]

---

## Utilisez [Tab]

---

# Utilisez [Tab]

---

## 3. La ligne de commande

### Obtenir de l'aide sur des commandes

```
man nom_de_commande
```
(navigation avec les fleches, `/mot` pour chercher un mot, `q` pour quitter)


Ou :
```
nom_de_comande --help
```
---



