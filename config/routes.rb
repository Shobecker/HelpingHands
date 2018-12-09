Rails.application.routes.draw do
  get 'customer_password_resets/new'

  get 'customer_password_resets/edit'

  get 'applicant_sessions/new'

  get 'admin_sessions/new'

  get 'worker_sessions/new'

  get 'customer_sessions/new'

  root 'static_pages#home'

  get  '/signupcustomer',  to: 'customers#new'
  get  '/apply', to: 'applicants#new'
  get  '/signupworker', to: 'workers#new'
  get  '/signupadmin', to: 'admins#new'

  post '/signupcustomer',  to: 'customers#create'
  post '/apply',  to: 'applicants#create'
  post '/signupworker',  to: 'workers#create'
  post '/signupadmin',  to: 'admins#create'
  post '/signupapplicant',  to: 'applicants#create'

  get    '/logincustomer',   to: 'customer_sessions#new'
  post   '/logincustomer',   to: 'customer_sessions#create'
  delete '/logoutcustomer',  to: 'customer_sessions#destroy'

  get    '/loginworker',   to: 'worker_sessions#new'
  post   '/loginworker',   to: 'worker_sessions#create'
  delete '/logoutworker',  to: 'worker_sessions#destroy'

  get    '/loginadmin',   to: 'admin_sessions#new'
  post   '/loginadmin',   to: 'admin_sessions#create'
  delete '/logoutadmin',  to: 'admin_sessions#destroy'

  get    '/loginapplicant',   to: 'applicant_sessions#new'
  post   '/loginapplicant',   to: 'applicant_sessions#create'
  delete '/logoutapplicant',  to: 'applicant_sessions#destroy'

  get 'static_pages/home'

  resources :customers

  resources :admins

  resources :applicants

#activates customer accounts
  resources :account_activations, only: [:edit]
  #activiates applicant accounts
  resources :applicant_account_activations, only: [:edit]
  #resources :customer_account_activations, only: [:edit_applicant, :edit_customer]

  resources :customer_password_resets,     only: [:new, :create, :edit, :update]

  resources :applicant_password_resets,     only: [:new, :create, :edit, :update]

  resources :jobs,          only: [:create, :destroy]
end
