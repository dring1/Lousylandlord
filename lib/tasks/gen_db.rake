namespace :gen_db do
	desc "TODO"
	task :gen_provs_cities => :environment do
		contents = File.read 'lib/tasks/list.txt'
 
		contents.each_line do |line|
			if line[0..1] === '--'
				@province = Province.new(name: "#{line[2..-2]}")
				@province.save
				#p @province
			else
				c = City.new(name: "#{line[0..-2]}")
				c.province = @province
				c.save
				
			end
		end

	end

end
