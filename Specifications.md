#Specifications

Le projet est constitué de plusieurs parties.

##Partie serveur
La partie centrale est celle du serveur Web.
Le serveur doit etre capable de répondre aux différentes connexions et requêtes des utilisateurs (se se connectant sur l'application Android ou tout autre...).
Le serveur Web sera en fait un service Web permettant (au minimum) :
* d'obtenir les positions d'autres personnes connectées sur l'application
* envoyer la position actuelle de l'utilisateur connecté

Il a été convenu d'utiliser NodeJS du coté serveur pour plusieurs raisons :
* rapidité de mise en place
* pas besoin de gérer de nombreux utilisateurs
* l'un de nous à des connaissances dessus


##Partie Android
Une seconde partie comporte une application Android (qui pourrait être déclinée pour iOS et Windows Phone).
Cette application permettra :
* de se connecter au service Web
* envoyer sa position gps au service web
* recevoir les positions gps d'autres utilisateurs connectés et les visualiser en temps réel sur une map

La mise à jour des positions est soit faite par l'application qui effectue une requête sur le serveur, soit c'est le serveur Web qui renvoie les positions des utilisateurs ayant bougés d'un Delta suffisant qui permet sa mise a jour chez les utilisateurs.

Cette application sera en Java.

