module PrizesHelper
  def trade_link(user_bottles, prize)
    if user_bottles < prize.bottles
      'Aún no reciclaste suficientes botellas... :('
    else
      link_to 'Canjear', trades_path(prize: prize.id), method: 'post'
    end
  end
end
