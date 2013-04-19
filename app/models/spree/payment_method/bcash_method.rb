module Spree
	class PaymentMethod::BcashMethod < PaymentMethod
		attr_protected
		preference :email, :string

    attr_accessor :order_id
    has_many :payments, :as => :source

		def payment_source_class
			self.class
		end

		def source_required?
			false
		end

		def actions
			%w{capture void}
		end

		def can_capture?(payment)
			['checkout', 'pending'].include?(payment.state)
		end

		def can_void?(payment)
			payment.state != 'void'
		end

		def capture(*args)
			ActiveMerchant::Billing::Response.new(true, "", {}, {})
		end

		def void(*args)
			ActiveMerchant::Billing::Response.new(true, "", {}, {})
		end

		def package(payment)
       bcash_payment = Spree::BcashPayment.new
       bcash_payment.process!(payment)
		end

	end
end
