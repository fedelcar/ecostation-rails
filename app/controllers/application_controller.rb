class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  private

  def after_sign_up_path_for(_resource)
    session[:previous_url] || root_path
  end

  def after_sign_in_path_for(_resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
