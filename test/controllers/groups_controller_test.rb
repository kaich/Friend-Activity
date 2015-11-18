require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  include Devise::TestHelpers

  setup do
    @group = groups(:one)
  end
  
  test "show should redirect login when not logged in" do
    get :show , id:@group
    assert_redirected_to new_user_session_url
  end


  test "destroy should redirect login when not logged in" do
    post :destroy , id:@group
    assert_redirected_to new_user_session_url
  end

  test "new should redirect login when not logged in" do
    post :new 
    assert_redirected_to new_user_session_url
  end

  test "update should redirect login when not logged in" do
    get :update ,id:@group 
    assert_redirected_to new_user_session_url
  end
end
