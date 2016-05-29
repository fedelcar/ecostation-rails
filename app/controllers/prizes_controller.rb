class PrizesController  < ApplicationController

  def index
    @bottles = current_user.bottles
    @value = current_user.bottles * 7
    @discount_value = current_user.bottles_in_money.round
    @bottles_value = (@value * 1.15).round
    if current_user.company.present?
      @prizes = current_user.company.prizes.order(bottles: :asc)
    else
      @prizes = Prize.all
    end
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


