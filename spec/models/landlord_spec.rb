require "spec_helper"

describe Landlord do
	before {@landlord = Landlord.new(name: "Omar Hashem", city: "Rar", province: "Quebexico")}
		
	

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
	describe "when city is not present" do
		before { @landlord.city = " " }
		it {should_not be_valid}
	end
	describe "when province is not present" do
		before { @landlord.province = " " }
		it {should_not be_valid}
	end

	#check if the name, city and province are the same, if so 
	#only add a comment to not create a new landlord
	describe "when creating a landlord that already exists" do
		before { @landlord.save }
		#let(:landlord_2) { FactoryGirl.build(:landlord) }
		#before {landlord_2.save}
	
		#it {@landlord.comments.should == 2 }

		
	end
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
		
	end



	
end
