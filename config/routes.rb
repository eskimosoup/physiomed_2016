# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    %w[400 403 404 422 500].each do |code|
      get code, to: 'errors#show', code: code
    end
  end

  get 'sitemap', to: 'application#sitemap'
  get 'physios', to: 'physios#index', as: :physios

  get 'what-we-do' => 'static_pages#show', id: 'what_we_do', as: 'what_we_do'

  resources :partners, only: :index
  resources :services, only: :show

  resources :landing_pages,
            only: :show,
            path: '',
            constraints: SlugConstraint.new(LandingPage)

  resource :physio_search, only: %i[create show], path: 'find-a-physio'

  resources :articles, only: %i[index show]
  resources :case_studies, only: %i[index show], path: 'case-studies'
  resources :contacts, only: %i[new create]
  resources :frequently_asked_questions, only: [:index], path: 'frequently-asked-questions'
  resources :job_listings, only: %i[index show], path: 'job-listings' do
    resources :job_applications, only: [:create], path: 'job-applications'
  end
  resources :pages, only: :show

  resources :practice_applications, only: %i[new create], path: 'practice-applications' do
    get 'thank-you', on: :collection
  end

  resources :subcategories, only: %i[index show], path: 'categorisation'
  resources :team_members, only: %i[index show], path: 'team-members'
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
    resources :sessions, only: %i[new create] do
      get 'logout', on: :collection
    end

    resources :services, only: :index
    resources :articles, only: %i[index show]

    resources :guides, only: %i[index show] do
      get 'general-well-being', on: :collection
    end

    resources :videos, only: :index

    root to: 'homes#show'
  end

  resources :guides, only: [] do
    resources :guide_downloads, only: %i[new create], path: 'download', as: :downloads do
      get 'optional', on: :collection
    end
  end

  mount Optimadmin::Engine => '/admin'

  # This has to be the last route in your list
  match '*path', to: 'errors#show', via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  root to: 'homes#show'
end

Optimadmin::Engine.routes.draw do
  namespace :mailchimp do
    resource :subscribers, only: :show
    get 'subcriber/:email_id', to: 'subscribers#show', as: :subscriber
    root to: 'homes#index'
  end

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

  # Module resources go below concerns
  resources :partners, concerns: %i[imageable toggleable]
  resources :services, concerns: %i[imageable toggleable] do
    scope module: :services do
      resources :sections, concerns: %i[imageable toggleable]
    end
  end

  resources :sections, only: [] do
    resources :items, concerns: %i[imageable toggleable], path: 'items', controller: 'services/section_items'
  end

  resources :additional_contents
  resources :guide_downloads, only: %i[index show]
  resources :landing_pages, concerns: %i[imageable toggleable], except: :show do
    resources :guides,
              only: [:index],
              controller: 'landing_pages/guides'
    resources :sections,
              concerns: %i[orderable toggleable imageable],
              except: [:show],
              controller: 'landing_pages/sections'
  end

  namespace :client_zone, path: 'client-zone' do
    resources :users, concerns: %i[orderable toggleable], except: [:show]
    resources :additional_contents, concerns: %i[orderable toggleable], except: [:show]
    resources :services, concerns: %i[orderable toggleable imageable], except: [:show]
  end

  resources :additional_home_contents, concerns: %i[orderable toggleable], except: [:show]
  resources :articles, concerns: %i[orderable toggleable imageable], except: [:show]
  resources :banners, concerns: %i[imageable orderable toggleable], except: [:show]
  resources :body_parts, concerns: %i[orderable toggleable], except: [:show] do
    resources :body_part_sections, shallow: true, concerns: %i[orderable toggleable imageable], except: [:show]
  end
  resources :case_studies, concerns: %i[orderable toggleable imageable], except: [:show]
  resources :categories, concerns: [:imageable], except: [:show]
  resources :clients, concerns: %i[imageable orderable toggleable], except: [:show]
  resources :employee_quick_links, concerns: %i[orderable toggleable], except: [:show]
  resources :employer_quick_links, concerns: %i[orderable toggleable], except: [:show]
  resources :frequently_asked_questions, concerns: %i[orderable toggleable]
  resources :guides, concerns: %i[orderable imageable orderable], except: [:show]
  resources :health_zones, concerns: %i[orderable toggleable imageable], except: [:show]
  resources :job_listings, except: [:show] do
    resources :job_applications, only: [:index]
  end
  resources :pages, concerns: %i[toggleable imageable], except: :show
  resources :people_helped_sections, concerns: [:toggleable], except: [:show]
  resources :practices, concerns: [:toggleable], except: [:show]
  resources :practice_applications, only: %i[index show]
  resources :seo_entries, concerns: %i[orderable toggleable], except: [:show] do
    collection do
      get 'rebuild_seo'
    end
  end
  resources :subcategories, concerns: %i[imageable toggleable orderable], except: [:show]
  resources :service_standards, concerns: %i[orderable toggleable], except: [:show]
  resources :team_member_categories, concerns: [:orderable], except: [:show]
  resources :team_members, concerns: %i[orderable toggleable imageable], except: [:show]
  resources :testimonials, concerns: %i[orderable toggleable], except: [:show]
  resources :what_we_dos, concerns: %i[orderable toggleable imageable], except: [:show] do
    resources :what_we_do_links, shallow: true, concerns: %i[orderable toggleable], except: [:show]
  end
  resources :videos, concerns: [:toggleable], except: [:show]
end
