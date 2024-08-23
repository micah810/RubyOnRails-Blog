Rails.application.routes.draw do

  #The root route below is mapped to the index action of ArticleController
  root "articles#index"

  #The route below declares that GET /articles requests are mapped
  # to the index action of ArticlesController.
  get "/articles", to: "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
