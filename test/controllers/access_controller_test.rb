require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  
  test "should return login page" do
      get(:login)
      assert_response :success
  end
  
  test "should redirect if already logged in" do
      cody = users(:cody)
      get(:login, nil, {'user_id' => cody.id})
      assert_response :redirect
  end
  
end
