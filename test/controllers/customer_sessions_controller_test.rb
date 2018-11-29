require 'test_helper'

class CustomerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_sessions_new_url
    assert_response :success
  end

end
