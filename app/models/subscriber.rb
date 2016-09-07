class Subscriber < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  attr_accessor :card_token

  def full_name
    "#{first_name} #{last_name}"
  end

  def location
    "#{region}, #{country}"
  end

  def details
  end
end
