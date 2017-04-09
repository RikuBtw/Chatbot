# ElastiChat, robot assistant
Une implémentation python d'un bot IRC, utilisant le moteur de recherche ElasticSearch.

## Contact
- Julien Aubert-Béduchaud : julien.aubert---beduchaud@etu.univ-nantes.fr
- Yann Gilles : yann.gilles@etu.univ-nantes.fr
- Ronan Godicheau-Tornier : ronan.godicheau--tornier@etu.univ-nantes.fr
- Guillaume Lefroy : guillaume.lefroy@etu.univ-nantes.fr

## License d'exploitation
Soumis à la license GNU GPL3

## Contenu du repertoire
Il est recommandé de disposer de l'ensemble des droits sur les fichiers du projet, à obtenir via `chmod -R u+xwr src/`

### Fichiers
- `bot.py` : Programme contenant le chatbot et son fonctionnement
- `desindexation_auto.py` : Permet de supprimer les couples de la base de données, outil de debug
- `esearch.py` : Contient les actions liées à la base elastic
- `indexation_auto.py` : Indexe les couples d'un fichier dans la base choisie.
- `search.py` : Effectue une recherche dans la base elastic, outil de debug
- `README.md` : Le fichier présent

#### Bot.py
- `es`, Il s’agit du socket sur lequel effectuer se trouve le serveur elastic. localhost est à modifier par le serveur souhaité et 9200 par le port sur lequel se connecter.
- `channel`, le nom du canal auquel se connecter. A entrer sous la forme #+nom
- `server`, le serveur sur lequel se connecte le bot. Il s’agit ici de localhost, le serveur étant par défaut redirigé vers celui-ci. A modifier par l’adresse du serveur distant si nécessaire.
- `nickname`, pseudo choisi par le bot. Le bot répondra à ce nom lorsque lancé.
- `Classe IRC`, contient le comportement nécessaire du bot, l’initialisation, la connection, l’envoi de message, la récupération de message, la gestion de la base de données. A modifier en cas d’ajout de fonctionnalité de base.
- `Ping Pong`, permet de gérer les serveur privés, le bot devant répondre un pong à chaque ping serveur. Ne pas modifier en cas d’utilisation d’un serveur privé
- `Apprentissage`, le fonctionnement de l’apprentissage est le suivant : à chaque requête sans mot-clé, la question est retenue en variable. Lors de la prochaine requête sans mot-clé, cette question sera associée à la réponse et le couple sera indexé dans la base grace à index(). Un message sera envoyé à chaque opération.
- `Messages`, fonctionnalités de base explicitées plus haut. Il s’agit du traitement des message reçus ou de la gestion des messages à envoyer à utilisateur. A modifier si besoin d’ajouter une fonctionnalité de traitement de l’information

#### Esearch.py
Ce fichier contient la classe `Esearch`, qui est l'interface permettant d'accéder aux fonctionnalités d'ElasticSearch en Python. Cette classe consiste majoritairement à simplifier l'utilisation du module Python `elasticsearch`, afin de l'adapter aux besoins spécifiques de notre projet. Toutes les fonctions sont documentées dans le code, vous trouverez ci-après des explications détaillées et un résumé des fonctions importantes.

L'initialisation nécessite deux paramètres: l'adresse IP (ou nom de domaine) du serveur, et son port d'écoute.

    `es = Esearch(127.0.0.1, 9200)`

Il est ensuite possible de créer ou supprimer un index sur le serveur (une table, en quelque sorte), en lui donnant un nom en paramètre.


    `es.create_index("base")`
    `es.delete_index("base")`

Les fonctions `create` et `delete` servent à créer ou supprimer un document dans un index donné. Nous utilisons ces fonctions pour l'indexation, elle sont internes à la classe. Elle prennent en argument un index et un identifiant de document, et dans le cas de la création, l'objet à indexer.

La fonction `search` demande un index dans lequel chercher et un terme ou une phrase à rechercher. Des paramètres sont ensuites ajoutés à la requête pour que le serveur ElasticSearch la comprenne et renvoie les résultats les plus pertinents.

    `es.search("base", "Salut, ça va ?")`
    
La fonction `index` prends en paramètre une chaîne préformatée, sous la forme question **tabulation** réponse, l'index dans lequel insérer le couple et un identifiant optionel. Si aucun identifiant n'est donné, la chaîne sera ajoutée à la fin de la base de donnée (l'identifiant sera le nombre de données indexées incrémenté de un).

    `es.index("Salut, ça va ?   Oui, et toi ?", "base")`

Enfin, la fonction `index_file`, qui permet d'indexer tout un fichier. Ce fichier doit contenir un couple correctement formatté par ligne. Il prends trois arguments: le chemin du fichier source, l'index à remplir, et un booléen indiquant s'il faut afficher la progression sur la sortie standard ou non (par défaut, n'affiche pas la progression).

   `es.index_file("./index_base.txt", "base", True)`
