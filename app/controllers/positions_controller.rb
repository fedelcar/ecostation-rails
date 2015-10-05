class PositionsController < ApplicationController

  private

    def position_params
      params.require(:position).permit()
    end
end

