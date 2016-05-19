Rails.application.routes.draw do
  resources :articles, only: [:index, :show]
  resources :case_studies, only: [:index, :show], path: "case-studies"
  resources :testimonials, only: [:index]
  resource :physio_search, only: [:create, :show], path: "find-a-physio"
  get "/health-and-well-being-zone", to: "wellbeings#show", as: :wellbeing
  
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

  resources :additional_home_contents, concerns: [:orderable, :toggleable], except: [:show]
  resources :articles, concerns: [:orderable, :toggleable, :imageable], except: [:show]
  resources :banners, concerns: [:imageable, :orderable, :toggleable], except: [:show]
  resources :body_parts, concerns: [:orderable, :toggleable], except: [:show]
  resources :case_studies, concerns: [:orderable, :toggleable, :imageable], except: [:show]
  resources :clients, concerns: [:imageable, :orderable, :toggleable], except: [:show]
  resources :employee_quick_links, concerns: [:orderable, :toggleable], except: [:show]
  resources :employer_quick_links, concerns: [:orderable, :toggleable], except: [:show]
  resources :practices, concerns: [:toggleable], except: [:show]
  resources :service_standards, concerns: [:orderable, :toggleable], except: [:show]
  resources :team_members, concerns: [:orderable, :toggleable, :imageable], except: [:show]
  resources :testimonials, concerns: [:orderable, :toggleable], except: [:show]
  resources :videos, concerns: [:toggleable], except: [:show]
end
