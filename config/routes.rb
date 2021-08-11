Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/blogs/new' => 'blog#new', as: 'new'
  get '/blogs/:id' => 'blog#show', as: 'blog'
  get '/blogs' => 'blog#index', as: 'blogs'
  get '/blogs/:id/edit' => 'blog#edit', as: 'edit'
  patch '/blogs/:id' => 'blog#update'
  post '/blogs' => 'blog#create'
  delete '/blogs/:id' => 'blog#destroy', as: 'delete'
  
  root 'blog#index'
end
