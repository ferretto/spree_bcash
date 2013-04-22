Spree::Order.class_eval do
  has_one :bcash_notification

  def self.bcash_payment_method
    Spree::PaymentMethod.where(type: "Spree::PaymentMethod::BcashMethod").first
  end

end
