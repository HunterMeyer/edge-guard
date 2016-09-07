class Player < Subscriber
  include Payment

  def discount_fee
    30
  end

  def full_fee
    35
  end

  def details
    "#{gamer_tag} - #{gamer_prefix} | #{sponsored_tag}"
  end

  def sponsored_tag
    sponsored ? "Sponsored by #{sponsors_name}" : 'Not Sponsored'
  end
end
