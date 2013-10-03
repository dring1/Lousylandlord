FactoryGirl.define do


	factory :comment, class: Comment do
		comment "PewPewPewPewPewPewPewPewPewPew"
		terms	true
		ip		"127.0.0.1"
	end
	factory :city, class: City do 

	end

end