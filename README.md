# MorseDecoder

## Cahier des charges pour un projet de décodeur Morse interactif sur FPGA Basys 3

## 1. Introduction
Ce projet vise à concevoir un décodeur Morse capable de convertir des impulsions manuelles en lettres et chiffres alphanumériques, affichés en temps réel sur les LED 7 segments ou via un écran VGA. Le système doit être interactif, précis et offrir une expérience utilisateur fluide.

## 2. Objectifs
- **Détecter** les impulsions (points et traits) générées par un bouton poussoir.
- **Identifier** les caractères correspondants au code Morse entré.
- **Afficher** les caractères décodés sur l'écran 7 segments ou sur un écran VGA.
- **Gérer** les erreurs d'entrée et signaler les séquences non valides.

## 3. Spécifications fonctionnelles
### Entrées :
- Un bouton poussoir pour générer les impulsions (points et traits).
- Un switch pour réinitialiser le système.

### Sorties :
- Affichage du caractère décodé sur les LED 7 segments ou un écran VGA.
- Une LED indiquant une séquence non valide.

### Fonctionnalités principales :
- **Détection de la durée des impulsions :**
  - Point : Appui court (par exemple, < 500 ms).
  - Trait : Appui long (par exemple, ≥ 500 ms).
- **Gestion des espaces entre les caractères :**
  - Pause courte : Séparation entre les signaux d’un même caractère.
  - Pause longue : Fin d’un caractère.
- **Décodage en temps réel** du code Morse selon la table standard.
- **Réinitialisation** du système en cas d’erreur ou sur demande.

## 4. Spécifications techniques
### Horloge interne :
- Utilisation de l'horloge 100 MHz intégrée pour mesurer la durée des impulsions.

### FSM (Finite State Machine) :
États pour gérer :
- L’attente d’une impulsion.
- La mesure de la durée de l’impulsion.
- L’identification du caractère.
- L’affichage.

### Décodage :
- Implémentation d’un arbre binaire pour représenter les caractères Morse et accélérer la correspondance des séquences.

### Affichage :
- Utilisation de 7 segments pour afficher les caractères ou de l’écran VGA pour un affichage plus avancé.

## 5. Contraintes
- **Temps réel :** Le système doit répondre immédiatement après une impulsion.
- **Utilisation des ressources FPGA :** Respecter la capacité limitée en LUTs (Look-Up Tables) et flip-flops de la Basys 3.
- **Ergonomie :** Boutons et switches faciles à utiliser, détection fiable des durées d’impulsions.

## 6. Étapes de réalisation
1. **Analyse et conception :**
   - Identifier les signaux d’entrée et de sortie.
   - Développer une FSM pour gérer le décodage.
   - Créer un arbre binaire pour le décodage des séquences.
2. **Développement matériel (VHDL/Verilog) :**
   - Implémenter le compteur pour mesurer la durée des impulsions.
   - Développer la FSM et le module de décodage.
   - Programmer les modules d’affichage.
3. **Simulation :**
   - Vérifier le fonctionnement des modules individuellement (testbench).
   - Simuler le système complet avant déploiement.
4. **Intégration et tests :**
   - Charger le programme sur la carte Basys 3.
   - Tester les entrées utilisateur (boutons, switches).
   - Ajuster les timings si nécessaire.
5. **Documentation :**
   - Rédiger un manuel d’utilisation.
   - Présenter les résultats obtenus.

## 7. Matériel requis
- Carte FPGA Basys 3 (Artix-7).
- Bouton poussoir intégré ou externe (si nécessaire).
- Source d’alimentation USB pour la carte.
- Logiciel de développement (Vivado de Xilinx).
- (Optionnel) Un écran VGA pour un affichage avancé.

## 8. Critères de réussite
- Détection fiable des points et traits avec les durées définies.
- Affichage précis des caractères décodés sur les LEDs ou l’écran.
- Signalisation correcte des erreurs (séquences invalides).
- Réinitialisation sans bug.
