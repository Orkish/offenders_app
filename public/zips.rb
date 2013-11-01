require 'open-uri'

central_harlem = [10026, 10027, 10030, 10037, 10039]
chelsea_clinton	= [10001, 10011, 10018, 10019, 10020, 10036]
east_harlem	= [10029, 10035]
gramercy_park_murray_hill	= [10010, 10016, 10017, 10022]
greenwich_village_soho = [10012, 10013, 10014]
lower_manhattan	= [10004, 10005, 10006, 10007, 10038, 10280]
lower_east_side	= [10002, 10003, 10009]
upper_east_side	= [10021, 10028, 10044, 10128]
upper_west_side	= [10023, 10024, 10025]
Inwood_washington_heights	= [10031, 10032, 10033, 10034, 10040


page = Nokogiri::HTML(open("http://www.criminaljustice.ny.gov/SomsSUBDirectory/search_index.jsp?offenderSubmit=true&LastName=&County=31&Zip=10011&Submit=Search"))

name = []
table = page.css('table')

data = page.css('table').search('td')

data.each do |row|
	name << row.children.text
end

name.each do |name|
	puts name
end