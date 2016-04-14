Rails.application.routes.draw do
  get "/wellbeing-zone", to: "wellbeings#index", as: :wellbeing
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
  resources :body_parts, concerns: [:orderable, :toggleable], except: [:show]
  resources :employee_quick_links, concerns: [:orderable, :toggleable], except: [:show]
  resources :employer_quick_links, concerns: [:orderable, :toggleable], except: [:show]
  resources :health_zones, concerns: [:imageable, :orderable, :toggleable], except: [:show]
end
