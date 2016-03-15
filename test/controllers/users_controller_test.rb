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
end
