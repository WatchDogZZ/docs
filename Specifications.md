#Specifications

##Architecture
Nous avons choisis de traiter l'architecture du projet en trois parties. La première est la partie serveur, celle-ci sera faite en nodeJS soutenu par une base de données MongoDB. La seconde L'application android sera développé en Java et compatible pour les frameworks Android version 3.0 et supérieurs. L'interface d'administration du serveur quant à elle sera développée en AngularJS.
Le serveur d'applications sera un serveur d'application compatible NodeJS sur AWS.

![Image de l'infrastructure](https://github.com/WatchDogZZ/docs/raw/master/infrastructure.png)

##Partie serveur
La partie centrale est celle du web service.
Le serveur doit etre capable de répondre aux différentes connexions et requêtes des utilisateurs (se se connectant sur l'application Android ou tout autre...).
Le serveur sera un service Web permettant (au minimum) :
* d'obtenir les positions d'autres personnes connectées sur l'application
* envoyer la position actuelle de l'utilisateur connecté
* proposer l'apk

Le serveur pourra aussi en option faire :
* historique des positions
* calcul d'itinéraire
* partage de position

Il a été convenu d'utiliser NodeJS du coté serveur pour plusieurs raisons :
* rapidité de mise en place
* faible nombre d'utilisateurs
* l'un de nous a des connaissances dessus

##Partie administration
Les fonctionnalités minimales pour l'application d'administration sont :
* visualisation des logs du serveur
* visualisation du contenu de la base de donnée

Ensuite les fonctionnalités avancées pourront être :
* gestion des utilisateurs

##Partie Android
Une seconde partie comporte une application Android (qui pourrait être déclinée pour iOS et Windows Phone).
Cette application permettra :
* de s'inscrire
* de se connecter
* envoyer sa position gps au service web
* recevoir les positions gps d'autres utilisateurs connectés
* visualiser en temps réel sur une carte les positions

L'application pourra évoluer et proposer :
* la carte en version 3D
* la carte en version VR
* l'ajout d'informations sur la carte (lieu / point de rdv)

Le choix d'une application Android se justifie par :
* la communauté Android est active
* la quantité de terminaux
* l'un de nous a des connaissances en Android

La mise à jour des positions est soit faite par l'application qui effectue une requête sur le serveur, soit c'est le serveur qui renvoie les positions des utilisateurs ayant bougé d'un delta suffisant qui permet sa mise à jour chez les utilisateurs.
Les frameworks 3.X+ seront supportés pour fonctionner sur un maximum de terminaux.

##Intégration continue
Un des objectifs de ce projet est de mettre en place une intégration continue et un déploiement automatique. Pour ce faire il est nécessaire d'avoir deux serveurs :
* un serveur d'application
* un serveur d'intégration

Le premier sera certainement un CaaS Amazon pour NodeJS.
Le serveur d'intégration sera un serveur Travis CI puisqu'il gère à la fois le NodeJS et l'Android (nouvelle fonctionnalité). Cela permettra contrairement à un serveur Jenkins de déployer facilement sans avoir à gérer un serveur mais juste en utilisant un service.
