class TransactionsController  < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :ecostation
  skip_before_action :authenticate_user!, only: :ecostation

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
      Transaction.create(user: user, bottles: bottles, time: Time.zone.now,
                         station_id: params[:stationId].to_i)
      if ! Station.find(params[:stationId].to_i).present? || Station.find(params[:stationId].to_i).company != user.company
        render json: {error: 'Invalid User'}, status: 400
      else
        render json: {user: user.email, bottles: user.bottles + bottles}, status: 200
      end
    else
      render json: {error: 'Invalid RFID'}, status: 400
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

