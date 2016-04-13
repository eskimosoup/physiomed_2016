Rails.application.routes.draw do
  mount Optimadmin::Engine => "/admin"
  root to: "homes#show"
end
Optimadmin::Engine.routes.draw do
  concern :imageable do
    member do
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  
  concern :orderable do
    collection do
      post 'order'
    end
  end

  concern :toggleable do
    member do
      get 'toggle'
    end
  end
  resources :banners, concerns: [:imageable, :orderable, :toggleable], except: [:show]
  resources :body_parts, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
end
