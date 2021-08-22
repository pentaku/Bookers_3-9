Rails.application.routes.draw do
  get 'books/new'
  get '/' => 'homes#top'
  get 'books' => 'books#index'
  post 'books' => 'books#create'
end
