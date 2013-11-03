area = []

@areas = Area.all

# @areas.each do |a|
# 	area << {name: a.name, children: a.zipcodes}
# end

i = 0
@areas.each do |a|
   area << {name: a.name, children: []}  
   a.zipcodes.each do |z|  
     area[i][:children] << {name: z.name, children: []}
   end
   i+= 1
 end   