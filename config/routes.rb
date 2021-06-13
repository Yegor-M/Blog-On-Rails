Rails.application.routes.draw do
  resources :users, param: :id
  resources :articles, param: :id
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { registrations: 'registrations' }
      get 'post/index'
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
      get '/articles' => 'article#index'
      get '/comments' => 'comment#index'
      post :create_article, to: 'article#create'
      post :create_comment, to: 'comment#create'
    end
  end
end
