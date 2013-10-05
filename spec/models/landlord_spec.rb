require "spec_helper"

describe Landlord do
	before do
		@c = City.new(name: "test town")
		p = Province.new(name: "test province")
		p.save
		@c.province = p
		@c.save
		a = Address.new(street:"Fake St.", unit:"2", postal:"555555",
					city: @ˇc)
		a.save
		@landlord = Landlord.new(name: "pew", city: @c, province: p)
	end

	subject {@landlord}

	it {should respond_to(:name)}
	it {should respond_to(:city)}
	it {should respond_to(:province)}
	it {should respond_to(:comments)}


	it  {should be_valid}


	describe "when name is not present" do
		before { @landlord.name = " " }
		it {should_not be_valid}
	end

	it  {should be_valid}

	describe "comment associations" do
		before { @landlord.save }
		let!(:older_comments) do
			FactoryGirl.create(:comment, landlord: @landlord, created_at: 1.day.ago)
		end
		let!(:new_comments) do
			FactoryGirl.create(:comment, landlord: @landlord, created_at: 1.hour.ago)
		end		
		it "should have the right comment order" do
			@landlord.comments.should == [new_comments,older_comments]	
		end

		it "should destroy associated comments" do
			comments = @landlord.comments
			@landlord.destroy
			comments.each do |comment|
				Comment.find_by_id(comment.id).should be_nil				
			end			
		end

		it "should have 100 comments" do
			@landlord.comments.destroy_all

			(0...100).each do |n|
				FactoryGirl.create(:comment, landlord: @landlord)
			end
			@landlord.comments.count.should == 100
		end
		
	end

	 # describe "Increase landlord count" do 
	 # 	l = Landlord.new(name: "Test 2")
	 # 	l.city = 
	 # end

	describe "add address to landlord" do
	  it "should allow addition of address" do
	    @address = @landlord.addresses.new(number:"123", street:"Fake St.", unit:"2", postal:"555555", city: @c)
	    @landlord.should be_valid
	    @landlord.save
	    p @landlord
	    @address.save
	    p @address
	  end
	end
end
