module Spree
  class BcashNotification < ActiveRecord::Base
    belongs_to :order

    attr_protected

    def self.create_from_params(params)
      notification = ::Bcash::Notification.new(params)

      self.create!(
        order_id: Order.find_by_number(notification.id_pedido).id,
        id_transaction: notification.id_transacao,
        status: notification.status
      )
    end
  end
end
