class Spectator < Subscriber
  include Payment

  def discount_fee
    25
  end

  def full_fee
    30
  end
end
