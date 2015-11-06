class PrizesController  < ApplicationController

  def index
    @prizes = current_user.company.prizes.order(bottles: :asc)
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


