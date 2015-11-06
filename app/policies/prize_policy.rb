class PrizePolicy < ApplicationPolicy
  def rails_admin?(action)
    if user.site_admin?
      case action
        when :destroy, :new
          true
        else
          super
      end
    elsif user.admin?
      case action
        when :destroy
          false
        when :edit, :new
          true
        else
          super
    end
      end
  end
end
