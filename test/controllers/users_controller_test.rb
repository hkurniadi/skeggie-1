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
end
