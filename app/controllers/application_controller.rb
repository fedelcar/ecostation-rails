class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!, except: [:sign_in, :new_user_session, :sign_up, :sign_in, :new]
  before_action :set_current_user
  include Pundit

  private

  def set_current_user
    User.current = current_user
    if current_user.present?
      @bottles = current_user.bottles
    end
  end

  def after_sign_up_path_for(_resource)
    session[:previous_url] || root_path
  end

  def after_sign_in_path_for(_resource)
    if current_user.admin? || current_user.site_admin?
      rails_admin_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
