# Décodeur Morse (Projet VHDL sur Carte Basys 3)

Ce dépôt contient l’intégralité du projet Vivado pour un **décodeur Morse** “sans gestion de temps” (basé sur des comptages d’appuis/relâchements) implémenté sur une **carte Basys 3**. Le dossier **MorseDecoder** regroupe toutes les ressources générées par Vivado (fichiers de synthèse, d’implémentation, de simulation, etc.) ainsi que les sources VHDL et les fichiers de contraintes.

---

## Sommaire

1. [Aperçu du Projet](#aperçu-du-projet)  
2. [Arborescence du Dépôt](#arborescence-du-dépôt)  
3. [Principaux Fichiers et Dossiers](#principaux-fichiers-et-dossiers)  
4. [Comment Ouvrir et Utiliser le Projet sur Vivado](#comment-ouvrir-et-utiliser-le-projet-sur-vivado)  
5. [Principe de Fonctionnement (Morse “Sans Temps”)](#principe-de-fonctionnement-morse-sans-temps)  
6. [Simulation](#simulation)  
7. [Implémentation et Bitstream](#implémentation-et-bitstream)  
8. [Crédits et Licence](#crédits-et-licence)

---

## Aperçu du Projet

L’objectif est de permettre la saisie de code Morse via **deux boutons** sur la carte Basys 3 :
- Un bouton pour **l’appui** (représentant le “point” unique, ou 3 appuis successifs pour un “trait”),  
- Un autre bouton pour **la pause** (1 pression pour la pause courte, 3 pour la pause longue, etc.).

Ainsi, aucune gestion du temps réel n’est nécessaire. On compte seulement le **nombre d’appuis successifs** afin de différencier les points, traits et espacements. Une fois la séquence validée, la lettre est convertie en code ASCII et affichée sur l’afficheur 7 segments.

---

## Arborescence du Dépôt

Ci-dessous, la structure **complète** du répertoire *MorseDecoder* (générée par Vivado). Seuls les dossiers et fichiers clés sont commentés :

```
MorseDecoder
├───MorseDecoder.cache          # Fichiers de cache générés par Vivado
│   └───wt
├───MorseDecoder.hw             # Informations liées au hardware (câblage, hardware manager...)
│   └───hw_1
├───MorseDecoder.ip_user_files  # Fichiers IP générés/nécessaires pour le projet
├───MorseDecoder.runs
│   ├───.jobs
│   ├───impl_1                  # Résultats d'implémentation (placements, routage, etc.)
│   └───synth_1                 # Résultats de synthèse
│       └───.Xil
├───MorseDecoder.sim            # Dossiers de simulation
│   └───sim_1
│       ├───behav               # Résultats de simulations comportementales
│       │   └───xsim
│       │       └───xsim.dir
│       │           ├───morse_decoder_top_tb_behav
│       │           ├───morse_to_binary_behav
│       │           └───morse_to_binary_tb_behav
│       ├───impl
│       │   └───func
│       └───synth
│           └───func
├───MorseDecoder.srcs           # **Dossier principal des sources VHDL et contraintes**
│   ├───constrs_1
│   │   └───new                 # Fichiers de contraintes (XDC)
│   ├───sim_1
│   │   └───new                 # Fichiers de testbench (VHDL)
│   └───sources_1
│       └───new                 # **Fichiers VHDL du décodeur**
└───... (autres fichiers automatiques de Vivado)
```

> **Remarque**: Selon la configuration de Vivado, certains sous-dossiers ou noms peuvent différer légèrement. L’essentiel est que le dossier `MorseDecoder.srcs` contient vos **fichiers de sources VHDL** ainsi que les **contraintes**.  

---

## Principaux Fichiers et Dossiers

- **`MorseDecoder.srcs/sources_1/new/`**  
  - `morse_to_binary.vhd` : Convertit la suite d’appuis/relâchements en code Morse binaire (1 pour un appui, 0 pour une pause).  
  - `binary_to_ascii.vhd` : Traduit le code Morse binaire en caractère ASCII.  
  - `ascii_to_display.vhd` : Gère l’affichage 7 segments (décalage des caractères déjà présents et insertion du nouveau).  
  - `morse_decoder_top.vhd` : *Module top-level* du projet qui relie tous les blocs.  

- **`MorseDecoder.srcs/constrs_1/new/`**  
  - `morse_decoder_constraints.xdc` : Fichier de contraintes pour la carte Basys 3 (assignation des pins, horloge, etc.).  

- **`MorseDecoder.srcs/sim_1/new/`**  
  - Fichiers de testbench (ex. `morse_decoder_top_tb.vhd`, `morse_to_binary_tb.vhd`, etc.), permettant de valider le fonctionnement en simulation.

- **`MorseDecoder.runs/synth_1`** & **`MorseDecoder.runs/impl_1`** : Dossiers où Vivado stocke les résultats de **synthèse** et d’**implémentation** (fichiers .dcp, logs, rapports, etc.).

- **`MorseDecoder.sim`** : Dossiers de travail pour les simulations, générés automatiquement par Vivado (pas nécessairement versionnés).

---

## Comment Ouvrir et Utiliser le Projet sur Vivado

1. **Cloner ce dépôt** ou **télécharger** le ZIP et extraire le dossier `MorseDecoder`.  
2. **Ouvrir Vivado** (version compatible, de préférence la même version que celle utilisée lors de la création du projet).  
3. Dans Vivado, **ouvrez le projet** :  
   - Soit via `File > Open Project` et pointez sur le fichier `.xpr` qui se trouve normalement dans le dossier `MorseDecoder`.  
   - Sinon, créez un **nouveau projet** puis **importez** les fichiers VHDL et le fichier `.xdc`.  
4. **Vérifiez** que `morse_decoder_top.vhd` est défini comme *Top Module*.  
5. Lancez la **synthèse**, l’**implémentation**, puis générez le **bitstream**.  
6. **Programmez** votre carte Basys 3 avec le fichier bit généré.  

---

## Principe de Fonctionnement (Morse “Sans Temps”)

Le projet remplace la notion de “durée” d’appui par un **comptage** du nombre d’appuis/relâchements :  
- **Point (.)** = 1 appui sur le bouton “point”.  
- **Trait (–)** = 3 appuis successifs sur ce même bouton.  
- **Pause courte** (pour séparer les éléments d’une même lettre) = 1 pression sur le bouton “pause”.  
- **Pause longue** (3 pressions) = espace entre lettres.  
- **Pause extra-longue** (7 pressions) = espace entre mots.  

Le module `morse_to_binary.vhd` reconstitue ainsi le code Morse, puis `binary_to_ascii.vhd` convertit ce code en ASCII. Enfin, `ascii_to_display.vhd` gère l’affichage sur 7 segments.  

---

## Simulation

Des bancs de test (testbench) sont inclus dans `MorseDecoder.srcs/sim_1/new/`. Pour les exécuter :  
1. Accédez à l’onglet **Simulation** dans Vivado.  
2. Lancez la simulation du fichier de test souhaité (ex. `morse_decoder_top_tb.vhd`).  
3. Observez les signaux (appuis, pauses, vecteurs binaire, code ASCII) pour vérifier le comportement attendu.  

---

## Implémentation et Bitstream

- Une fois la synthèse et l’implémentation terminées, vous obtiendrez un **fichier `.bit`** dans `MorseDecoder.runs/impl_1/`.  
- **Programmez la carte Basys 3** via l’onglet *Hardware Manager* ou via la commande en console.  

> **Note** : Avant de programmer, assurez-vous que votre carte Basys 3 est bien connectée en USB, que les drivers sont installés et que le jumper de configuration est correctement réglé (Généralement sur “USB”).

---

## Crédits et Licence

- **Auteurs** : Axel Alabéatrix, Jules Musart, Hatim Cheikh
- **Contexte** : Projet universitaire de décodeur Morse sur FPGA (VHDL).  
- **Licence** : Libre d’utilisation à des fins académiques ou personnelles. Pour toute autre utilisation, merci de contacter les auteurs.  

Pour plus de détails, reportez-vous à la [documentation PDF](./documentation.pdf) incluse ou à la **description** dans les commentaires des fichiers VHDL.