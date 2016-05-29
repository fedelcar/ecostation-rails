class VouchersController < ApplicationController

  def index
    @vouchers = Voucher.find_by_user_id_and_consumed(current_user.id, false)
  end

  def new
    if current_user.bottles_in_money.to_i == 0
      flash[:error] = 'No tienes saldo! Andá a reciclar'
      redirect_to :root
      return
    end

    money = current_user.bottles_in_voucher
    bottles = current_user.bottles

    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    code = (0...15).map { o[rand(o.length)] }.join

    @voucher = Voucher.new(bottles: bottles, total: money, consumed: false, code: code, created_at: DateTime.now, user: current_user)

    current_user.update_attributes(bottles: 0)
    redirect_to :show_voucher, @voucher
    return
  end

end

