module TransactionsHelper
  def date_and_time(time)
    if time.present?
      time.strftime('%d/%m/%y %H:%M')
    end
  end
end
