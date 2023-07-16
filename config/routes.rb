Rails.application.routes.draw do
  # resources :books
  root 'books#index' # 2. root 建立
  get '/books', to: 'books#index' # 1. /books 建立

  get '/books/new', to: 'books#new' # 3. /books/new 建立
  post '/books', to: 'books#create' # 4.

  get '/books/:id', to: 'books#show', as: 'book' # 5.

  get '/books/:id/edit', to: 'books#edit', as: 'edit_book' # 6.
  patch '/books/:id/', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
