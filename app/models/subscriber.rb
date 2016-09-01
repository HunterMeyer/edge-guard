class Subscriber < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  attr_accessor :card_token
end
