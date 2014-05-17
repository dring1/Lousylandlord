namespace :gen_db do
	task :gen_provs_cities => :environment do
		contents = File.read 'lib/tasks/list.txt'
 
		contents.each_line do |line|
			if line[0..1] === '--'
				@province = Province.new(name: "#{line[2..-2]}")
				@province.save
			else
				c = City.new(name: "#{line[0..-2]}")
				c.province = @province
				c.save
				
			end
		end

	end
	task :gen_landlords => :environment do
		first_names = ['John', 'Michael', 'Bubbles', 'Guy','smith', 'burns', 'apples', 'dirtbag']
		(1..1000).each do
			p Landlord.create(name: "Shtbucket", 
				city_id: City.all.sample(1)[0].id , 
				province_id: Province.all.sample(1)[0].id)
			
		end
	end
end
