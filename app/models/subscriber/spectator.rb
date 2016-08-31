class Spectator < Subscriber
  def charge_amount
    DateTime.parse('2016-11-10').future? ? '2500' : '3000'
  end
end
