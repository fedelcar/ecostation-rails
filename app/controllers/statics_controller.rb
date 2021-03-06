class StaticsController < ApplicationController

  def home
    if current_user.present?
      @bottles = current_user.bottles
      if current_user.site_admin?
        @stations = Station.all
      else
        @stations = current_user.company.stations if current_user.company.present?
      end

      @gMapsHash = Gmaps4rails.build_markers(@stations) do |station, marker|
        marker.lat station.positions.last.lat
        marker.lng station.positions.last.lng
      end
    end
  end

  def faq
  end
end
