Deface::Override.new(
  virtual_path: "spree/shared/_order_details",
  name: "replace_payment_info_bcash",
  insert_bottom: ".payment-info",
  partial: "spree/checkout/payment/order_details_bcash"
)
