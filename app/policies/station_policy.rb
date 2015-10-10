class StationPolicy < ApplicationPolicy
  def rails_admin?(action)
    case action
      when :new, :index, :export, :history_index, :show, :history_show
        true
      else
        if user.site_admin?
          true
        else
          false
        end
    end
  end
end
