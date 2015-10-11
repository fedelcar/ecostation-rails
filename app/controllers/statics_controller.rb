class StaticsController < ApplicationController

  def home
    @bottles = current_user.bottles
    @transactions = current_user.transactions.includes(:station).order(created_at: :desc).last(5)
    @trades = current_user.trades.order(created_at: :desc).last(5)
    @stations = current_user.company.stations
  end
end
