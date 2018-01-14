require 'test_helper'

class ListItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get list_items_show_url
    assert_response :success
  end

end
