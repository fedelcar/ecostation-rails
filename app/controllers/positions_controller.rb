class PositionsController < InheritedResources::Base

  private

    def position_params
      params.require(:position).permit()
    end
end

