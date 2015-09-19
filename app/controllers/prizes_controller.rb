class PrizesController < InheritedResources::Base

  private

    def prize_params
      params.require(:prize).permit()
    end
end

