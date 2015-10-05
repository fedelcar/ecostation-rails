class PrizesController  < ApplicationController

  def index
    @prizes = Prize.all.order(bottles: :asc)
    @trades = Trade.where(user: current_user).includes(:prize)
  end

  private
    def prize
      @prize ||= Prize.find(params[:id])
    end

    def prize_params
      params.require(:prize).permit(:name, :description, :bottles, )
    end
end


