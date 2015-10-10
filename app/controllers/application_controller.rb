class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!, except: [:new, :sign_up]
  include Pundit

  private

  def after_sign_up_path_for(_resource)
    session[:previous_url] || root_path
  end

  def after_sign_in_path_for(_resource)
    session[:previous_url] || root_path unless current_user.admin?
    rails_admin_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
