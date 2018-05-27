Rails.application.routes.draw do

  resources :categories
  devise_for :users
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
  
=begin
  acciones CRUD(create,read,updated,delete)
    get '/articles' index
    post '/articles'  create
    delete '/articles'  delete
    get 'articles/:id'  show
    get 'articles/new'  new
    get 'articles/:id/edit' edit
    patch '/articles/:id' update
    put '/articles/:id' update
=end

end
