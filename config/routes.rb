Linkbib::Application.routes.draw do

  devise_for :users 
  resources :links
  resources :relationships
  resources :users do
    member do
      get :following, :followers
    end
  end
  root :to => 'pages#home'
  get "/:id", :to => "users#show", :as => :user
end
