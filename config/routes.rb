Weidulog::Application.routes.draw do
  resources :logs
  root :to => "logs#new"
end
