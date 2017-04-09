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
