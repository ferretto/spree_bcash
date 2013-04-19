module Spree
  class BcashPayment
    def process!(payment)
      order = payment.order

      items = []
      items = order.line_items.map do |item|
        bcash_item = ::Bcash::Item.new(
          {
            id: item.id,
            description: item.product.name,
            amount: item.quantity,
            price: format("%.2f", item.price.round(2))
          }
        )

        bcash_item
      end

      ::Bcash::Package.create(items, tax(order))
    end

    private

    def tax(order)
      taxes = 0

      order.adjustments.eligible.each do |adjustment|
        next if adjustment.originator_type == 'Spree::TaxRate' && adjustment.amount == 0
        taxes += adjustment.amount
      end

      taxes
    end

  end
end
