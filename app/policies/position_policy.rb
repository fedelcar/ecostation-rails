class PositionPolicy < ApplicationPolicy
  def rails_admin?(action)
    if user.site_admin?
      case action
        when :destroy, :new
          true
        else
          super
      end
    elsif user.admin?
      false
      # case action
      #   when :destroy, :edit
      #     false
      #   else
      #     super
    # end
    end
  end
end
