class TransactionsController < InheritedResources::Base

  private

    def transaction_params
      params.require(:transaction).permit()
    end
end

