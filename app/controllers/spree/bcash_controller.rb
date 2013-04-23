module Spree
  class BcashController < BaseController
    protect_from_forgery :except => [:notify]
    skip_before_filter :restriction_access

    def notify
      notification = Spree::BcashNotification.create_from_params(params)

      if notification.cod_status == "1"
        Order.transaction do
          @order = Spree::Order.find_by_number(notification.id_pedido)

          @order.payment.complete
        end
      end

      redirect_to order_path(id: notification.id_pedido)
    end
  end
end
