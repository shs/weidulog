Weidulog::Application.routes.draw do
  resources :logs, :only => [:index, :show, :new, :create]
  resources :mods
  root :to => "logs#new"
end
