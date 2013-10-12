FactoryGirl.define do
	factory :landlord, class: Landlord do
		
	end

	factory :comment, class: Comment do
		comment "PewPewPewPewPewPewPewPewPewPew"
		terms	true
		ip		"127.0.0.1"
	end
	factory :province, class: Province do
		name "TEST PROVINCE"
	end
	factory :city, class: City do 
		name "TEST CITY"
		province_id 1
	end

end