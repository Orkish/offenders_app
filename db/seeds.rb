require 'open-uri'
require 'pry'

City.delete_all
Area.delete_all
Zipcode.delete_all
Person.delete_all


area_array = ["Central Harlem", "Chelsea Clinton", "East Harlem", "Gramercy Park & Murray Hill", "Greenwich Village & Soho", "Lower Manhattan", "Lower East Side", "Upper East Side", "Upper West Side", "Inwood & Washington Heights"]


area_seed = {
	"Central Harlem" => [10026, 10027, 10030, 10037, 10039],
	"Chelsea Clinton" => [10001, 10011, 10018, 10019, 10020, 10036],
	"east_harlem" => [10029, 10035],
	"Gramercy Park & Murray Hill" => [10010, 10016, 10017, 10022],
	"Greenwich Village & Soho" => [10012, 10013, 10014],
	"Lower Manhattan" => [10004, 10005, 10006, 10007, 10038, 10280],
	"Lower East Side" => [10002, 10003, 10009],
	"Upper East Side" => [10021, 10028, 10044, 10128],
	"Upper West Side" => [10023, 10024, 10025],
	"Inwood & Washington Heights" => [10031, 10032, 10033, 10034, 10040]
}

manhattan = City.create(name: "Manhattan")

# area_array.each do |x|
# 	area = Area.create(name: x)
# 	manhattan.children << area
# end


area_seed.each do |key, value|
	puts "Creating the Area!"
	@area = Area.create(name: key)
	puts @area
	value.each do |v|
		puts "#{v} is the value!"
		puts "Creating the zips"
		zip = Zipcode.create(name: v.to_s)
		puts zip.name
		puts @area.name
		puts "Insterting zips into area.children"
		@area.children << zip
		@area.save
		@area.save(validate: false)
		binding.pry
		puts @area.children
	end
	manhattan.children << @area
end





# area_seed.each do |k,v|
# 	area = Area.create(name: k)
# 	manhattan.children << area
# 	zip = Zipcode.create(name: v)
# 	area.children << zip.name
	
# end	



# page = Nokogiri::HTML(open("http://www.criminaljustice.ny.gov/SomsSUBDirectory/search_index.jsp?offenderSubmit=true&LastName=&County=31&Zip=10011&Submit=Search"))

# name = []
# table = page.css('table')

# data = page.css('table').search('td')

# data.each do |row|
# 	name << row.children.text
# end

# name.shift

# name.each do |name|
# 	puts name
# end