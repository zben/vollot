Vollot::Application.routes.draw do
  resources :polls, only: [:index, :new, :show, :create]

  get "vote/:choice_id" => "votes#create", as: "vote"
  get ":id" => "polls#show", as: "permalink"
  root "polls#new"
end
