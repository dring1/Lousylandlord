require 'spec_helper'

describe Comment do
	let(:landlord) { FactoryGirl.create(:landlord) }
	before{@comment = landlord.comments.build(comment: "This guy sucks", terms: true, ip:"127.0.0.1")}
	
	subject {@comment}

	it { should respond_to(:landlord)}
	it { should respond_to(:comment)}
	it { should respond_to(:ip)}
	it { should respond_to(:terms)}


   	it {should be_valid}

   	describe "when landlord_id is not present" do
   		before { @comment.landlord_id = nil}
		it {should_not be_valid}   		
   	end

   	describe "accessible attr" do
   		it "should not allow acces to landlord_id" do
	   		expect do
	   			Comment.new(landlord_id: landlord.id)
	   		end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
	   	end
   	end
   	
end

