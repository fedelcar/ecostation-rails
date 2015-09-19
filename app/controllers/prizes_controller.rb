class PrizesController < InheritedResources::Base

  def index
    @prizes = Prize.all
  end

  private
    def prize
      @prize ||= Prize.find(params[:id])
    def prize_params
      params.require(:prize).permit(:name, :description, :bottles, )
    end
end


