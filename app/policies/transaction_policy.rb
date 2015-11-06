class TransactionPolicy < ApplicationPolicy
  def rails_admin?(action)
    if user.site_admin?
      true
    elsif user.admin?
      case action
        when :destroy, :edit, :new
          false
        else
          true
      end
    end
  end
end
