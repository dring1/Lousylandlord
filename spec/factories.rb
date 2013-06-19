FactoryGirl.define do
	factory :landlord do
		name "Sir Swaggle Bottom"
		city "Ottawa"
		province "Ontario"
	end

	factory :comment do
		comment "PewPew"
		terms	true
		ip		"127.0.0.1"
	end
end