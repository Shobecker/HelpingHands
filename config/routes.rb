Rails.application.routes.draw do
  root 'static_pages#home'

  get  '/signup',  to: 'customers#new'

  get  '/apply', to: 'applicants#new'

  get  '/signupworker', to: 'workers#new'

  get  '/createadmin', to: 'admins#new'

  post '/signupcustomer',  to: 'customers#create'

  post '/apply',  to: 'applicants#create'

  post '/signupworker',  to: 'workers#create'

  post '/createadmin',  to: 'admins#create'


  get 'static_pages/home'

  resources :customers

  resources :workers

  resources :admins

  resources :applicants












  get  '/login',    to: 'static_pages#login'
  get  '/application',   to: 'static_pages#application'
  get 'static_pages/login'

  get 'static_pages/application'

  get 'static_pages/signup'

  get 'static_pages/updateaccount'

  get 'static_pages/updateworker'

  get 'static_pages/userhome'

  get 'static_pages/workerhome'

  get 'static_pages/adminhome'

  get 'static_pages/workerlogin'

  get 'static_pages/adminlogin'

  get 'static_pages/viewapplicants'

  get 'static_pages/viewjobs'

  get 'static_pages/invoice'

  get 'static_pages/joblaunch'

  get 'static_pages/jobrequest'

  get 'static_pages/closejobs'
end
