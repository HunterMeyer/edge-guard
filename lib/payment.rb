module Payment
  extend ActiveSupport::Concern

  included do
    include Stripe::Callbacks
    include InstanceMethods

    after_charge_failed! do |data|
      user = Subscriber.find_by_customer_token(data.customer)
      user.update(payment_status: 'Failed')
      Message.send_payment_failure(user)
    end

    after_charge_succeeded! do |data|
      user = Subscriber.find_by_customer_token(data.customer)
      user.update(payment_status: 'Active')
    end

    def save_with_payment
      if valid?
        customer = Stripe::Customer.create(description: type, email: email, card: card_token)
        charge   = Stripe::Charge.create(customer: customer.id, amount: fee * 100, description: 'Melvin Tournament', currency: 'usd')
        self.customer_token = customer.id
        self.payment_status = 'Processing'
        save!
      end
    rescue Stripe::InvalidRequestError => e
      self.card_token = nil
      logger.error "Stripe error while creating subscriber #{self.id}: #{e.message}"
      errors.add :base, 'There was a problem with your credit card.'
      false
    end
  end

  module InstanceMethods
    def discount_end_date
      @discount_end_date ||= DateTime.parse('2016-11-10')
    end

    def fee
      discount_end_date.future? ? discount_fee : full_fee
    end
  end
end
