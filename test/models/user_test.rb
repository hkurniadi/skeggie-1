require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User unique' do
    user = User.new({"username" => "test", "password" => "testing"})
    user.save
    user2 = User.new({"username" => "test", "password" => "asadw"})
    assert_not user2.save, "Saved the user with the same name"
  end
  
  test 'Password blank' do
    user = User.new({"username" => "test"})
    assert_not user.save, "Saved the user with no password"
  end
  
  test 'Username blank' do
    user = User.new({"password" => "testing"})
    assert_not user.save, "Saved user with no username"
  end
  
  test 'Password less than 5 characters' do
    user = User.new({"username" => "test", "password" => "test"})
    assert_not user.save, "Saved user with password < 5 characters"
  end
end
