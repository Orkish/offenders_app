require 'open-uri'

zip = {}
areas = {}
city = {}

city[:name] = "Manhattan"
areas[:children] = zip
city[:children] = areas


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

area_seed do |k,v|
	areas[:name] = k
	areas[:children] << v
	
end	



page = Nokogiri::HTML(open("http://www.criminaljustice.ny.gov/SomsSUBDirectory/search_index.jsp?offenderSubmit=true&LastName=&County=31&Zip=10011&Submit=Search"))

name = []
table = page.css('table')

data = page.css('table').search('td')

data.each do |row|
	name << row.children.text
end

name.shift

name.each do |name|
	puts name
end