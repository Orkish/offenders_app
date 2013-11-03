require 'open-uri'
require 'pry'

City.delete_all
Area.delete_all
Zipcode.delete_all
Person.delete_all

zip_array = []


# area_array = ["Central Harlem", "Chelsea Clinton", "East Harlem", "Gramercy Park & Murray Hill", "Greenwich Village & Soho", "Lower Manhattan", "Lower East Side", "Upper East Side", "Upper West Side", "Inwood & Washington Heights"]


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


area_seed.each do |key,value|

	# CREATES AN AREA FOR EACH AREA.
	@area = Area.create(name: key)

	value.each do |v|

		# FOR EACH AREA'S ZIP, IT SCRAPES THE PEOPLE in #{v} and reinitializes the person_name array
		person_name = []
		page = Nokogiri::HTML(open("http://www.criminaljustice.ny.gov/SomsSUBDirectory/search_index.jsp?offenderSubmit=true&LastName=&County=31&Zip=#{v}&Submit=Search"))
		data = page.css('table').search('td')

		# FOR EACH ROW OF DATA, IT APPENDS THE PERSON'S NAME into person_name array
		data.each do |row|
			person_name << row.children.text
		end

		# SHIFTING THE FIRST ROW...
		person_name.shift

		# CREATES THE ZIPCODE OBJECT
		@zip = Zipcode.create(name: v)

		# CREATES THE PERSON and APPENDS THE PERSON INTO THE ZIP
		person_name.each do |p|
			@person = Person.create(name: p)
			@zip.people << @person
		end
		
		@area.zipcodes << @zip
	end

end

# zip = []
# @zips = Zipcodes.all

# n = 0

# @zips.each do |z|
#    zip << {name: z.name, children: []}  
#    z.people.each do |p|  
#      zip[n][:children] << {name: p.name, size: 2000}
#    end
#    n+= 1
#  end   

area = []
@areas = Area.all

i = 0
n = 0

@areas.each do |a|
	# FOR EACH AREA, CREATES AN ELEMENT OF NAME: AREA, WITH CHILDREN = EMPTY ARRAY.
  area << {name: a.name, children: []} 

  # FOR EACH AREA'S ZIPCODE, CREATES THE ZIPCODE OBJ, AND PUTS IT IN THE AREA'S CHILDREN ARRAY.
  a.zipcodes.each do |z|
  	n = 0
    area[i][:children] << {name: z.name, children: []}
    z.people.each do |p|
    	area[i][:children][n][:children] << {name: p.name, size: 2000}
    end
   n +=1
  end
  i+= 1
end

city = {name: "Manhattan", children: area}

file = "offenders.json"

File.open(file,"w+") do |stuff|
	stuff << city
end

binding.pry



# area_seed.each do |key, value|
# 	puts "Creating a new Zip array!"
# 	zip_array = []
# 	value.each do |v|
# 		puts "#{v} is the value!"
# 		puts "Creating the zips"
# 		zip = Zipcode.create(name: v.to_s)
# 		puts zip.name
# 		puts "Putting zip in zip_array!"
# 		# binding.pry
# 		zip_array << zip
# 	end
# 	binding.pry
# 	@area = Area.create(name:key, children: zip_array)
# end


# area_seed.each do |k,v|
# 	area = Area.create(name: k)
# 	manhattan.children << area
# 	zip = Zipcode.create(name: v)
# 	area.children << zip.name
	
# end	



page = Nokogiri::HTML(open("http://www.criminaljustice.ny.gov/SomsSUBDirectory/search_index.jsp?offenderSubmit=true&LastName=&County=31&Zip=10011&Submit=Search"))

person_name = []
table = page.css('table')

data = page.css('table').search('td')

data.each do |row|
	person_name << row.children.text
end

person_name.shift