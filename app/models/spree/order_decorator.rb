Spree::Order.class_eval do
  has_one :bcash_notification

  def self.bcash_payment_method
    Spree::PaymentMethod.where(type: "Spree::PaymentMethod::BcashMethod").first
  end

  def self.options_for_bcash(order, request)
    url_retorno = request.host_with_port + "/bcash/notify"
    {
      :url_retorno => url_retorno,
      :id_pedido => order.number,
      :email_loja => Spree::Order.bcash_payment_method.preferred_email  
    }
  end

end
