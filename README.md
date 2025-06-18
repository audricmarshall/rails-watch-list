# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

DERNIER COMMIT projet WatchList:

Refonte UI/UX & Background vidéo + Système d’avis publics
Fonctionnalités ajoutées / changements principaux
Vidéo de fond : une vidéo (bg_cinema.mp4) s’affiche en fond sur toutes les pages, elle tourne en boucle automatiquement (loop, autoplay, muted). Ça donne une vraie ambiance cinéma

Overlay : un filtre semi-transparent par-dessus la vidéo pour garder le texte lisible

Bannière Hero Header : ajout d’une grande image de fond (background_hero2.jpg) en haut de la page d’accueil, avec un dégradé noir pour bien voir le titre

Design refait (SCSS) : le code CSS a été totalement revu pour que tout soit moderne, agréable sur ordi, tablette ou mobile : cartes, miniatures de films, boutons, section commentaires, tout est responsive

Page “Preview” de film : quand onn clique sur un film, on vois une grande affiche, le résumé, la note, un bouton retour… et la nouvelle section pour laisser des avis publics

Section Avis publics : n’importe qui peut laisser un commentaire + une note sur 10 pour chaque film, et ils s’affichent tous dans la preview

Nouveau modèle Review : il enregistre le contenu et la note, lié à chaque film (migration rails db:migrate)

Correction images films : les films utilisent maintenant poster_url (plus image_url) pour l’affiche.

Routes REST : les avis sont gérés sous chaque film (/movies/:movie_id/reviews), la preview est accessible via /movies/:id/preview

Barre de navigation (navbar) : boutons modernisés, nouveaux styles, totalement responsive
