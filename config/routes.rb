Weidulog::Application.routes.draw do
  resources :logs, :only => [:index, :show, :new, :create]
  root :to => "logs#new"
end
