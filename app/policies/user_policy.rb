class UserPolicy < ApplicationPolicy
  def rails_admin?(action)
    if user.site_admin?
      case action
        when :destroy, :new, :show
          true
        else
          super
      end
    elsif user.admin? && !user.site_admin?
      case action
        when :destroy, :edit
          true
        when :show
          true
        else
          super
    end
      end
  end
end
