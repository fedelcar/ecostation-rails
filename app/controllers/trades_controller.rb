class TradesController < InheritedResources::Base

  private

    def trade_params
      params.require(:trade).permit()
    end
end

