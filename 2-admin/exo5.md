# Administration Linux - feuille d'exercice n.5

## 8 - Tâches automatiques avec `cron` et `at`

- 8.1 - Utiliser `at` (soit en interactif, soit via un script) pour écrire, au bout de deux minutes, les mots "C'est automagique !" dans un fichier `magic.txt`. Dans les secondes avant que la tâche ne se déclenche, regardez le contenu du dossier `/var/spool/atjobs/`.
- 8.2 - Sur votre serveur, dans un des dossiers `/etc/cron.*`, remarquez l'existence d'un script `logrotate`. Renseignez-vous sur l'utilité et la raison d'être de ce script/programme.
- 8.3 - À l'aide de `wget`, ajoutez un cron job (sur votre serveur) qui retélécharge toutes les heures les slides de cours et les rends disponibles via votre site.
- 8.4 - Sur votre serveur, téléchargez quelques images de chatons (ou autre) dans un nouveau dossier `img` dans `/var/www/mywebiste` (c.f. 7.3 et 7.4). Créez un script (non automatisé pour le moment) qui permet de choisir une image aléatoire parmis toute celles disponible, et utilise cette image sur votre page d'acceuil. Pour ce faire, : 
    - vous pouvez choisir un nombre aléatoirement avec la variable spéciale `$RANDOM`, 
    - mettre en place un fichier `template.html` qui contient le code de votre page web mais où le chemin de l'image est un mot clef comme `CHEMIN_IMAGE`. Votre script pourra alors utiliser `sed` pour généner `index.html` en remplacant `CHEMIN_IMAGE` par le vrai chemin.
- 8.5 - Une fois votre script validé, ajouter un job cron qui lancera ce script toutes les minutes pour choisir une nouvelle image aléatoirement
- 8.6 - Même principe, mais cette fois créez une page `monitor.html` qui contiendra des informations régulièrement mises à jour (e.g. toutes les quelques minutes) à propos du serveur : RAM utilisée / disponible, uptime, processus les plus gourmands, l'heure qu'il est, et un rapport des IPs récemment bannies par fail2ban ...
