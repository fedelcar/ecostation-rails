class TradesController < InheritedResources::Base

  def create
    prize = Prize.find(params[:prize])
    if current_user.bottles >= prize.bottles
      Trade.create(user: current_user, date: Time.zone.today, prize: prize)
      current_user.update_attributes(bottles: current_user.bottles - prize.bottles)
      flash[:notice] = 'Felicitaciones! Que disfrutes de tu premio'
    else
      flash[:error] = 'No tenes mas botellas pelotudo'
    end
    redirect_to prizes_path
  end

  private

    def trade_params
      params.require(:trade).permit()
    end
end

