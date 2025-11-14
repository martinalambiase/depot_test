# Cours 4 : Publier sur GitHub Pages

> Ce cours explique comment **déployer un site web** sur **GitHub Pages** à l’aide de **GitHub Desktop**.

Résultat : 

Site déployé sur GitHub Pages [ici](https://cuso-2025-ed-num-online.github.io/cours-4_Publier_sur_GitHub-Pages/)

---

## Table des matières
- [Contenu du dépôt](#contenu-du-dépôt)
  - [Structure d’un projet pour GitHub Pages](#structure-dun-projet-pour-github-pages)
  - [Slides](#slides)
- [Ressources complémentaires](#ressources-complémentaires)

---

## Contenu du dépôt

Le dépôt contient les éléments suivants :

### 🔹 Structure d’un projet pour GitHub Pages

Chaque dossier présente l’architecture type d’un projet HTML et reproduit une chaîne de traitement pour publier en **HTML** des documents **TEI** via un script **XSLT**.

>  **Astuce :** respecter cette structure facilite le déploiement du site et clarifie la gestion de vos fichiers.

N’oubliez pas le fichier `index.html`, positionné à la racine du projet :

| Élément | Description |
|----------|--------------|
| 📁 [`CSS/`](./Exemples_de_structure_html/CSS) | Contient les **feuilles de style** externes (`.css`). |
| 📁 [`HTML/`](./Exemples_de_structure_html/HTML) | Contient les **pages HTML**. |
| 📁 [`IMG/`](./Exemples_de_structure_html/IMG/) | Contient les **images** à publier en ligne. |
| 📁 [`JS/`](./Exemples_de_structure_html/JS/) | Contient les **scripts JavaScript** utilisés pour les interactions. |
| 📁 [`Scripts/`](./Exemples_de_structure_html/Scripts/) | Contient les **scripts XSLT** utilisés pour transformer les fichiers TEI en HTML. |
| 📁 [`TEI/`](./Exemples_de_structure_html/TEI/) | Contient les **documents TEI/XML** utilisés comme base pour la transformation HTML. |
| 📄 [`index.html`](index.html) | Contient la **page d’accueil** du site web, sur laquelle se déploie le workflow **GitHub Pages**. |

---

### 🔹 Slides

Le **PDF de la leçon** est disponible dans le dossier [`/Slides`](./Slides/).

---

## Ressources complémentaires

- 🔗 [Documentation GitHub Desktop](https://docs.github.com/en/desktop)
- 🔗 [Documentation GitHub Pages](https://docs.github.com/fr/pages)
- 🔗 [Documentation pour le GitLab de l’UNIGE](https://catalogue-si.unige.ch/gitlab)

---

> **Dernière mise à jour :** 31 octobre 2025
