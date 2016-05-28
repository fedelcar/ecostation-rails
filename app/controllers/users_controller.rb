class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :sign_up]
  def edit
    @user = User.find(current_user)
  end

  def create
    User.create(user_params)
    binding_pry
    redirect_to root_path

  def update
    current_user.update_attributes(user_params)
    redirect_to edit_user_path
  end

  private
    def user
      @user ||= User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :dni)
    end
end

