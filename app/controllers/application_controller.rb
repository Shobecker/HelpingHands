class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CustomerSessionsHelper
  include WorkerSessionsHelper
  include AdminSessionsHelper
  include ApplicantSessionsHelper
end
