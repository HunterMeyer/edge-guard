class Player < Subscriber
  def charge_amount
    DateTime.parse('2016-11-10').future? ? '3000' : '3500'
  end
end
