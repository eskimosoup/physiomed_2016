Rails.application.routes.draw do
  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  get 'sitemap', to: 'application#sitemap'
  get 'physios', to: 'physios#index', as: :physios

  get 'what-we-do' => 'static_pages#show', id: 'what_we_do', as: 'what_we_do'

  resource :physio_search, only: [:create, :show], path: 'find-a-physio'

  resources :articles, only: [:index, :show]
  resources :case_studies, only: [:index, :show], path: 'case-studies'
  resources :contacts, only: [:new, :create]
  resources :frequently_asked_questions, only: [:index], path: 'frequently-asked-questions'
  resources :job_listings, only: [:index, :show], path: 'job-listings' do
    resources :job_applications, only: [:create], path: 'job-applications'
  end
  resources :pages, only: :show
  resources :practice_applications, only: [:new, :create], path: 'practice-applications'
  resources :subcategories, only: [:index, :show], path: 'categorisation'
  resources :team_members, only: [:index, :show], path: 'team-members'
  resources :testimonials, only: [:index]

  namespace :wellbeing_zone, path: 'well-being-zone' do
    get 'general-well-being', to: 'general_wellbeings#show', as: :general_wellbeing

    get 'general-well-being/guides', to: 'guides#general_wellbeing'

    resources :body_parts, only: [:show], path: '', constraints: SlugConstraint.new(BodyPart) do
      resources :guides, only: :index
    end
    root to: 'wellbeings#show'
  end

  namespace :client_zone, path: 'client-zone' do
    resources :sessions, only: [:new, :create] do
      get 'logout', on: :collection
    end

    root to: 'homes#show'
  end

  mount Optimadmin::Engine => '/admin'

  # This has to be the last route in your list
  match '*path', to: 'errors#show', via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  root to: 'homes#show'
end

Optimadmin::Engine.routes.draw do
  resources :reorderings, only: [:index]

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

  namespace :client_zone, path: 'client-zone' do
    resources :users, concerns: [:orderable, :toggleable], except: [:show]
  end

  resources :additional_home_contents, concerns: [:orderable, :toggleable], except: [:show]
  resources :articles, concerns: [:orderable, :toggleable, :imageable], except: [:show]
  resources :banners, concerns: [:imageable, :orderable, :toggleable], except: [:show]
  resources :body_parts, concerns: [:orderable, :toggleable], except: [:show] do
    resources :body_part_sections, shallow: true, concerns: [:orderable, :toggleable, :imageable], except: [:show]
  end
  resources :case_studies, concerns: [:orderable, :toggleable, :imageable], except: [:show]
  resources :categories, concerns: [:imageable], except: [:show]
  resources :clients, concerns: [:imageable, :orderable, :toggleable], except: [:show]
  resources :employee_quick_links, concerns: [:orderable, :toggleable], except: [:show]
  resources :employer_quick_links, concerns: [:orderable, :toggleable], except: [:show]
  resources :frequently_asked_questions, concerns: [:orderable, :toggleable]
  resources :guides, concerns: [:orderable, :imageable, :orderable], except: [:show]
  resources :health_zones, concerns: [:orderable, :toggleable, :imageable], except: [:show]
  resources :job_listings, except: [:show] do
    resources :job_applications, only: [:index]
  end
  resources :pages, concerns: [:toggleable, :imageable], except: :show
  resources :people_helped_sections, concerns: [:toggleable], except: [:show]
  resources :practices, concerns: [:toggleable], except: [:show]
  resources :practice_applications, only: [:index, :show]
  resources :seo_entries, concerns: [:orderable, :toggleable], except: [:show] do
    collection do
      get 'rebuild_seo'
    end
  end
  resources :subcategories, concerns: [:imageable, :toggleable, :orderable], except: [:show]
  resources :service_standards, concerns: [:orderable, :toggleable], except: [:show]
  resources :team_member_categories, concerns: [:orderable], except: [:show]
  resources :team_members, concerns: [:orderable, :toggleable, :imageable], except: [:show]
  resources :testimonials, concerns: [:orderable, :toggleable], except: [:show]
  resources :what_we_dos, concerns: [:orderable, :toggleable, :imageable], except: [:show] do
    resources :what_we_do_links, shallow: true, concerns: [:orderable, :toggleable], except: [:show]
  end
  resources :videos, concerns: [:toggleable], except: [:show]
end
