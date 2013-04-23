Spree::Core::Engine.routes.prepend do
  match "bcash/notify", to: "bcash#notify", method: :post
end
