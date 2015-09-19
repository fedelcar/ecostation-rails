class TransactionsController < InheritedResources::Base
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

  private
    def transaction
      @transaction ||= Transaction.find(params[:id])
    end
    def transaction_params
      params.require(:transaction).permit(:user_id, :bottles, :time, :station_id)
    end
end

