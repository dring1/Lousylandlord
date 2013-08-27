require "spec_helper"

describe Landlord do
	before do
		@landlord = Landlord.new(name: "test 1")
		city = City.new(name: "pewtown")
		province = Province.new(name: "Pewington")
		@landlord.city = city
		@landlord.province = province
		p @landlord.city
		p @landlord.province
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

	 describe "comment validity" do 
	 	
	 end

	
end
