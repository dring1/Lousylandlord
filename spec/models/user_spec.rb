require 'spec_helper'

describe User do
	before do 
		@user = User.new(email: "test")
	end

	subject(@user)

	it {should respond_to :email}
	it "should be valid" do
		expect(@user).to be_valid
	end
	describe "when email address already exists" do	
		before do 
		end
	end
end
