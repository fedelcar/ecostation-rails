class CompanyPolicy < ApplicationPolicy
  def rails_admin?(action)
    if user.site_admin?
      true
    else
      false
    end
  end
end
