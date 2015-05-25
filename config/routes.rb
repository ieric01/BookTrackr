Rails.application.routes.draw do
 
  root 'books#index'
  
  resources :books do
  	resources :authors
  end

 post 'books/:id', to: 'books#destroy'

end
