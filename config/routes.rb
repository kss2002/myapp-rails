Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :posts

  # // resources :posts는 아래의 모든 라우팅을 자동으로 생성하는 명령어

  #get "/posts", to: 'posts#index'
  #get '/posts/new', to: 'posts#new'
  #get '/posts/:id', to:'posts#show'
  #post '/posts', to: 'posts#create'
  #get '/posts/:id/edit', to: 'posts#edit'
  #patch '/posts/:id', to: 'posts#update'
  #delete '/posts/:id', to: 'posts#destroy'
  
  # ---------------
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
