Rails.application.routes.draw do
  # resources :books
  root 'books#index' # 2. root 建立
  get '/books', to: 'books#index' # 1. /books 建立

  get '/books/new', to: 'books#new' # 3. /books/new 建立
  post '/books', to: 'books#create' # 4.

  get '/books/:id', to: 'books#show', as: 'book'
end
