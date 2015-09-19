class UsersController < InheritedResources::Base
  def edit
    @user = User.find(current_user)
  end

  def update
    user.update_attributes(user_params)
    redirect_to edit_user_path
  end
  
  private
    def user
      @user ||= User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end

