class Subscriber < ActiveRecord::Base
  include Payment
  validates :first_name, :last_name, :email, presence: true
  attr_accessor :card_token
end
