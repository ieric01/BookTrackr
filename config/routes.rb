Rails.application.routes.draw do
 
  root 'books#index'
  
 	post 'books/:id', to: 'books#destroy'
  
 	resources :books do
  	resources :authors
  end


end
