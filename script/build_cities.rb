contents = File.read 'list.txt'

contents.each_line do |line|
	if line[0..1] == "--"
		@province = Province.new(line[2..-1])
		@province.save
	else
		c = City.new("#{@province}")
		c.save
	end
end


