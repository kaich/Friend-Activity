require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @group = groups(:one)
  end
  
  test "name should not be empty" do
    @group.name = "" 
    assert_not @group.valid? 
  end

  test "intro should less then 1001" do 
    @group.intro = ""
    assert @group.valid?
    @group.intro = "n" * 1001
    assert_not @group.valid?
  end 

end
