module Kounta

	class Order < Kounta::Resource
		property :company_id
		property :status
		property :customer
		property :register_id
		property :site_id
		property :lines
		property :payments
		property :callback_uri
		property :placed_at
		property :fulfil_at
		property :notes
		property :total
		property :paid
		property :product

		coerce_key :lines, Kounta::Line
		coerce_key :payments, Kounta::Payment

		def initialize(hash={})
			super(hash)
			self.payments ||= []
			self.lines ||= []
		end

		def to_hash
			super({
				lines: lines.map {|line| line.to_hash },
				payments: payments.map {|payment| payment.to_hash }
			})
		end

		def resource_path
			{companies: company_id, orders: id}
		end

		# we manually map these
		def ignored_properties
			super([:lines, :payments])
		end

	end

end