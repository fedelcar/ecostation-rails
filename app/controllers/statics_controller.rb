class StaticsController < ApplicationController

  def home
    @bottles = current_user.bottles
    @transactions = current_user.transactions.includes(:station).last(5)
    @trades = current_user.trades.last(5)
  end
end
