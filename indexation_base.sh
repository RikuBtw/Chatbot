#!/bin/sh
echo "Début de l'indexation"
python ./src/indexation_auto.py ./indexation/index_base.txt base
echo "Indexation terminée"
exit 0
