Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/login'

  get 'static_pages/application'

  get 'static_pages/createaccount'

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
