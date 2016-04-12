Rails.application.routes.draw do
  mount Optimadmin::Engine => "/admin"
  root to: "homes#show"
end
Optimadmin::Engine.routes.draw do
resources :body_parts, except: [:show] do
  collection do
    post 'order'
  end
  member do
    get 'toggle'
  end
end
end
