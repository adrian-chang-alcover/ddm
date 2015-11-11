Rails.application.routes.draw do

  resources :infos

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount TasksManagement::Engine, at: "/tasks_management"

  get 'home/index'

  get 'dashboard/index'
  get 'dashboard/request_task'
  get 'dashboard/start_task'
  get 'dashboard/finish_task'
  get 'dashboard/accept_task'
  get 'dashboard/reject_task'

  namespace :schedule do
    resources :turns
  end

  namespace :schedule do
    resources :turn_types
  end

  namespace :schedule do
    resources :docent_categories
  end

  namespace :schedule do
    resources :scientific_degrees
  end

  namespace :schedule do
    resources :professors
  end

  namespace :schedule do
    resources :p1s
  end

  namespace :schedule do
    resources :locals
  end

  namespace :schedule do
    resources :groups
  end

  namespace :schedule do
    resources :docent_weeks
  end

  namespace :schedule do
    resources :docent_days
  end

  namespace :schedule do
    resources :distributions
  end

  namespace :schedule do
    resources :activities
  end

  resources :groups

  resources :locals

  resources :turns

  resources :turn_types

  resources :career_accreditations

  resources :accreditation_categories

  resources :universities

  get 'faculties/careers_for_select'

  get 'careers/disciplines_for_select'
  get 'careers/semesters_for_select'

  resources :study_modalities

  get 'repositorio/index'

  get 'users/index'
  get 'users/toggle_roles'

  devise_for :users

  get 'activities/index'

  get 'ppd/report'
  get 'ppd/export'

  get 'parser/ppd_vivo'
  post 'parser/ppd_vivo'

  get 'parser/ppd'
  post 'parser/ppd'

  get 'parser/per_semester'
  post 'parser/per_semester'

  resources :study_plans

  resources :curriculum_types

  resources :subjects

  resources :evaluation_types

  resources :semesters

  resources :years

  resources :disciplines

  resources :careers

  resources :faculties

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
