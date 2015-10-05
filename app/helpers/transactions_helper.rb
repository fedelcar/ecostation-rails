module TransactionsHelper
  def date_and_time(time)
    time.strftime('%d/%m/%y %H:%M')
  end
end
