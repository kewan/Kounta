require "helper"

describe Kounta::Site do

	before do
		@site = Kounta::Company.new.site(985)
	end

	it "should have an id" do
		@site.id.should be(985)
	end

	it "should have a name" do
		@site.name.should eq("Online Store")
	end

	it "should have a code" do
		@site.code.should eq("Online")
	end

	it "should have products" do
		@site.products.each {|product| product.should be_an_instance_of(Kounta::Product) }
	end

	it "should have a product" do
		@site.product(3274192).should be_an_instance_of(Kounta::Product)
	end

	it "should have categories" do
		@site.categories.each {|category| category.should be_an_instance_of(Kounta::Category) }
	end

	it "should have a category" do
		@site.category(8263).should be_an_instance_of(Kounta::Category)
	end

	it "should have addresses" do
		@site.addresses.each {|address| address.should be_an_instance_of(Kounta::Address) }
	end

	it "should have an address" do
		@site.address(8263).should be_an_instance_of(Kounta::Address)
	end

end