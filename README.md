# Collaboration Deck

Ce deck est un ensemble d'outils pour la prise de décision et la collaboration
sous forme de cartes à jouer.

Il a été crée pour assister une expérience démocratique pour des enfants de 6 à
17 ans tenue par les Scouts et Guides de France : le Conseil National des Jeunes.

Il a depuis été utilisé auprès d'équipes adulte dans le privé et le public afin
d'outiller et d'autonomiser la recherche de solutions et la prise de décision en
groupe.

L'ensemble du projet est sous license Creative Commons 4.0 BY-NC-SA

[![Licence](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/)

## Installation

### Avec `rvm`

#### Installer rvm

    > curl -L get.rvm.io > rvm-install
    > bash < ./rvm-install

    > source ~/.rvm/scripts/rvm

#### Choisir la version de ruby

    > rvm install ruby-3.1.2  # ruby-stable
    > rvm use ruby-3.1.2 [--default]

#### Installer les dépendances du projet

    > gem install squib game_icons

## Regénérer le deck

    > source ~/.rvm/scripts/rvm
    > ruby codex.rb

Le résultat est généré dans le dossier `_output`. Les cartes une par une en png. L'ensemble du deck dans un document pdf.

## Agrémenter le deck

Les cartes sont générées à partir du fichier `data.xlsx`. Il est conseillé de l'éditer avec un tableur.

La feuille de calcul comporte les colonnes suivantes :
* **name**
  Le titre que vous souhaitez donner à la carte
* **symbol**
  Une illustration issue de https://game-icons.net/
  Pour trouver le nom du symbole, il suffit de regarder l'url de l'icon choisi.
  Par exemple, `barn-owl` pour https://game-icons.net/1x1/caro-asercion/barn-owl.html
* **type**
  - d pour `prise de Décision` (fond de carte orange)
  - s pour `recherche de Solution` (fond de carte rouge brique)
* **duration**
  - short affichera un sablier
  - medium affichera 2 sabliers
  - long affichera 3 sabliers
* **notice**
  Si le champ n'est pas vide un symbole `/!\` apparaitra dans un coin de la carte
* **description**
  La description de votre carte
