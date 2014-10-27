module Spree
  class BcashNotification < ActiveRecord::Base
    belongs_to :order


    def self.create_from_params(params)
      notification = ::Bcash::Notification.new(params)

      notify = self.find_by_id_transaction(notification.id_transacao)
      if notify
        notify.update_attributes(status: notification.status.force_encoding("iso-8859-1"))
      else
        self.create!(
          order_id: Order.find_by_number(notification.id_pedido).id,
          id_transaction: notification.id_transacao,
          status: notification.status.force_encoding("iso-8859-1")
        )
      end

      notification
    end
  end
end
