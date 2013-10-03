require 'spec_helper'

describe Address do
	before do
		c = City.new(name: "test town")
		p = Province.new(name: "test province")
		p.save
		c.province = p
		c.save
		@address = Address.new(street:"Fake St.", unit:"2", postal:"555555",
					city: c)
	end

	subject {@address}

	it {should respond_to(:street)}
	it {should respond_to(:unit)}
	it {should respond_to(:postal)}
	it {should respond_to(:city)}

	it {should be_valid}
	


end
