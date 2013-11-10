Vollot::Application.routes.draw do
  get "pages/about"
  resources :polls, only: [:index, :new, :show, :create]

  get "vote/:choice_id" => "votes#create", as: "vote"
  get "about" => "pages#about"
  get ":id" => "polls#show", as: "permalink"
  root "polls#new"
end
