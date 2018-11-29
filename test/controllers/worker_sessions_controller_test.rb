require 'test_helper'

class WorkerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get worker_sessions_new_url
    assert_response :success
  end

end
