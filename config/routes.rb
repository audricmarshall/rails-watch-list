Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "list#index" # on root direct vers la page index pour éviter la page rails
  # je declare les routes avec resources pour les listes
  resources :lists, only: %i[index show new create] do
    # je nest les routes bookmarks dans une liste
    resources :bookmarks, only: %i[new create]
  end
  # je met la root destroy en dehors pour supprimer un bookmark, pas besoin de
  # préciser dans quel liste il est car chaque bookmarks a un ID unique
  resources :bookmarks, only: %i[destroy]
end
