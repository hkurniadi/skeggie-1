require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	
	test "should return profile search" do
		get(:profile_search)
		assert_response :success
	end
	
	
	test "should return profile search with params" do
		get(:profile_search, {:search_by => "1", :search_term => "Test"})
		assert_response :success
	end
	
	test "should return one profile" do
		get(:profile_search, {:search_by => "1", :search_term => "Cody"})	
		assert_select 'li'
		assert_select 'a'
		assert_response :success
	end
	
	test "should return profile page" do
		get(:profile, {:username => "Cody"})
		assert_response :success	
	end
	
	test "should not return profile page" do
		get(:profile, {:username => "Nothere"})
		assert_response :redirect
	end
	
	test "should return major page" do
		cody = users(:cody)
		get(:major_reqs, {:username => "Cody"}, {'user_id' => cody.id})
		assert_response :success
	end
	
	test "should return edit page" do
		cody = users(:cody)
		get(:edit, {:username => "Cody"}, {'user_id' => cody.id})
		assert_response :success
	end 
	
	test "should redirect from edit page" do
		scott = users(:scott)
		get(:edit, {:username => "Cody"}, {'user_id' => scott.id})
		assert_response :redirect
	end
	
	test "should have add friend button" do
		cody = users(:cody)
		get(:profile, {:username => "Scott"}, {'user_id' => cody.id})
		assert_select "form input[type=submit][name=commit][value='Add Friend']"
	end
	
	test "should have a remove friend button" do
		scott = users(:scott)
		cody = users(:cody)
		scott.friend_ids.push(cody.id)
		scott.save
		get(:profile, {:username => "Cody"}, {'user_id' => scott.id})
		assert_select "form input[type=submit][name=commit][value='Remove Friend']"
	end
	
	test "should return schedule page with no events" do
		cody = users(:cody)
		get(:schedule, {:username => "Cody"}, {'user_id' => cody.id})
		assert_response :success
		assert_select "td.schedlrg.bg-success", 0
	end
	
	test "should return schedule page with 6 events" do
		cody = users(:cody)
		cody.current_courses.push('2016 Spring cmpt 276 D100 LEC')
		cody.save!
		get(:schedule, {:username => "Cody"}, {'user_id' => cody.id})
		assert_response :success
		assert_select "td.schedlrg.bg-success", 6
	end
	
	test "should redirect from cart page if there is no session" do
		get (:cart)
		assert_response :redirect
	end
	
	test "should return cart page with no classes" do
		cody = users(:cody)
		get(:cart, nil, {'user_id' => cody.id})
		assert_response :success
		assert_select 'ol', 0
		assert_select 'li', 10 ## In nav bar
		assert_select 'ul', 3 ## In nav bar
	end
	
	test "should return cart page with 1 class and have remove from cart button" do
		cody = users(:cody)
		cody.current_courses = ['2016 Spring cmpt 276 D100 LEC']
		cody.save!
		get(:cart, nil, {'user_id' => cody.id})
		assert_response :success
		assert_select 'ol', 1 
		assert_select 'li', 12 ## 10 In nav bar
		assert_select 'ul', 4 ## 3 In nav bar
		assert_select "form input[type=submit][name=commit][value='Remove from Cart']"
	end
end
