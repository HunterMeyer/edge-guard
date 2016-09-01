class Player < Subscriber
  include Payment

  def discount_fee
    30
  end

  def full_fee
    35
  end
end
