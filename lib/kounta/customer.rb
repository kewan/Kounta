require_relative "resource"

module Kounta

	class Customer < Kounta::Resource

		def initialize(data)
			@data = data
		end

		def id
			@data['id'] ? @data['id'].to_i : nil
		end

		def company_id
			@data['company_id'] ? @data['company_id'].to_i : nil
		end

		def first_name
			@data['first_name']
		end

		def first_name= (value)
			@data['first_name'] = value
		end

		def last_name
			@data['last_name']
		end

		def last_name= (value)
			@data['last_name'] = value
		end

		def name
			"#{first_name} #{last_name}"
		end

		def primary_email_address
			@data['primary_email_address']
		end

		def primary_email_address= (value)
			@data['primary_email_address'] = value
		end

		def to_hash
			{
				first_name: first_name,
				last_name: last_name,
				primary_email_address: primary_email_address
			}
		end

		def addresses
			client.objects_from_response(Kounta::Address, :get, {companies: company_id, customers: id, addresses: nil})
		end

		def address(address_id)
			client.object_from_response(Kounta::Address, :get, {companies: company_id, customers: id, addresses: address_id})
		end

		private

		def missing_required_attributes?
			!company_id
		end

		def resource_path
			{companies: company_id, customers: id}
		end	

	end

end