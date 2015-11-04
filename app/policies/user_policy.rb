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
          false
        when :show
          scope.where(company_id: self.user.company_id)
        else
          super
    end
      end
  end
end
