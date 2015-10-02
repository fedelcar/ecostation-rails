class TransactionsController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token, only: :ecostation

  def new
    @transaction = Transaction.new
  end

  def create
    Transaction.create(transaction_params.merge(user:current_user))
    redirect_to transactions_path
  end

  def index
    @transactions = Transaction.where(user: current_user).includes(:station)
  end

  # endpoint for the post received from the ecostations
  def ecostation
    if user = User.find_by(rfid: params[:rfid])
      bottles = params[:bottlesCount].to_i
      user.bottles += bottles
      user.save
      Transaction.create(user: user, bottles: bottles, time: Time.zone.now,
                         station_id: params[:stationId].to_i)
      render json: {user: user.email, bottles: user.bottles}, status: 200
    else
      render json: {error: 'Invalid RFID'}, status: 404
    end
  end

  private
    def transaction
      @transaction ||= Transaction.find(params[:id])
    end
    def transaction_params
      params.require(:transaction).permit(:user_id, :bottles, :time, :station_id)
    end
end

