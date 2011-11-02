Upslope::Application.routes.draw do
  resources :glossaries

  root :to => 'glossaries#index'
end
