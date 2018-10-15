# Administration Linux - feuille d'exercice n.5

## 8 - Tâches automatiques avec `cron` et `at`

- 8.4, 8.5 : Le fichier `template.html` contient :

```html
<html>

Hello world
<br>
<img src="CHEMIN_IMAGE">

</html>
```

Et le script `random_kitty.sh` :

```bash
#!/bin/bash

cd /var/www/mywebsite

NUMBER=$(bc <<< "$RANDOM % 10")

sed "s@CHEMIN_IMAGE@./kitty_$NUMBER.jpg@g"  template.html > index.html
```

Il suffit ensuite de trouver et télécharger 10 images de chatons nommées `kitty_0.jpg` à `kitty_9.jpg` et d'ajouter un job cron (en root) qui appelle le script toutes les minutes par exemple :

```bash
  * *   *   *   *    bash /var/www/mywebsite/random_kitty.sh
```

- 8.6 : Voici un exemple de réponse avec d'une part `monitoring_template.html` :

```html
<html>
This is the monitoring page !<br>
<br>
Today is DATE<br>
The server is up since UP_SINCE <br>
There is RAM_FREE RAM free out of RAM_TOTAL total RAM.<br>
Here is a report of the recently banned IPs :<br>
FAIL2BAN_REPORT
</html>
```

et d'autre part le script `monitoring.sh` correspondant :

```bash
#!/bin/bash

cd /var/www/mywebsite

RAM_TOTAL=$(free -h | grep "^Mem:" | awk '{print $2}')
RAM_FREE=$(free -h | grep "^Mem:" | awk '{print $4}')
DATE=$(date +"%d/%m/%Y")
UP_SINCE=$(uptime --since)
FAIL2BAN_REPORT=$(cat /var/log/fail2ban.log | grep Ban | grep sshd | awk '{print $8}' | sort | uniq -c | sort -r | sed 's@$@<br>@g' | tr -d "\n")

cat monitoring_template.html \
	| sed "s@RAM_TOTAL@$RAM_TOTAL@g" \
	| sed "s@RAM_FREE@$RAM_FREE@g" \
	| sed "s@DATE@$DATE@g" \
	| sed "s@UP_SINCE@$UP_SINCE@g" \
	| sed "s@FAIL2BAN_REPORT@$FAIL2BAN_REPORT@g" \
	> monitoring.html
```

ce script peut être transformé en tâche Cron, par exemple avec cette syntaxe qui le lancera toutes les 10 minutes pendant les jours de travail :
```bash
  */10 *   *   *   1-5    bash /var/www/mywebsite/monitoring.sh
```
