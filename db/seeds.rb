# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
response = HTTParty.get("http://www.sfu.ca/bin/wcm/academic-calendar?2016/spring/courses")
response.each do |val|
	for i in 0..5
		dep_response = HTTParty.get("http://www.sfu.ca/bin/wcm/academic-calendar?2016/spring/courses/#{val["value"]}")
		if dep_response.code == 200
			break
		end
	end
	dep_response.each do |course|
		cur = Course.create(department: val["value"], coursenum: course["value"])
		for i in 0..5
			cour_response = HTTParty.get("http://www.sfu.ca/bin/wcm/academic-calendar?2016/spring/courses/#{val["value"]}/#{course["value"]}")
			if cour_response.code == 200
				break
			end
		end
		cur.wqb = cour_response["designation"]
		if cour_response["sections"] != []
			cur.semesters.push("Spring 2016")
		end
		cur.title = cour_response["title"]
		cur.save
	end
end