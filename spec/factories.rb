FactoryGirl.define do
	factory :landlord, class: Landlord do
		name "Sir Swaggle Bottom Fist"
		
		
	end

	factory :comment, class: Comment do
		comment "PewPewPewPewPewPewPewPewPewPew"
		terms	true
		ip		"127.0.0.1"
	end
end