require 'test_helper'

class PagesControllerTest < ActionController::TestCase
	test "should return search" do
		get(:search) 
		assert_response :success
	end 
	
	test "should contain list of courses" do
		get(:search, {:semester => "Spring 2016", :subject => "CMPT"})
		assert_select 'tr'
		assert_select 'td', 'CMPT 276'
	end
	
	test "search should link to course sections" do
		get(:search, {:semester => "Spring 2016", :subject => "CMPT"})
		assert_select 'a', 'View Sections'
	end
	
	test "search with course number should have link to course" do
		get(:search, {:semester => "Spring 2016", :subject => "CMPT", :coursenum => "276", :sort => "1"})
		assert_select 'a', 'View'
	end
	
	test "should not have add to past/current course" do
		get(:search, {:semester => "Spring 2016", :subject => "CMPT"})
		assert_select 'div', false, 'past_course_button'
		assert_select 'div', false, 'current_course_button'
	end
	
	test "should return course" do
		get(:course, {:semester => "Spring 2016", :subject => "CMPT", :coursenum => "276", :section => "D100"})
		assert_response :success
	end
end
