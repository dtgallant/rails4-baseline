Rails.application.routes.draw do

  get '/home' => 'home#index'

  mount Upmin::Engine => '/admin'


  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  # devise_scope :user do
  # 	root :to => "devise/sessions#new"
  # end

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  get "users/new" => "users#new", as: :users_new_user
  post "users/create_user" => "users#create", as: :users_create_user 
  get "users/:id/edit" => "users#edit", as: :users_edit_user 
  put "users/:id" => "users#update", as: :users_update_user 

  resources :users


 

end
