class ApplicationController < ActionController::Base
  #jpmobile
  include Jpmobile::ViewSelector

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
