require 'test_helper'

class ApplicantSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get applicant_sessions_new_url
    assert_response :success
  end

end
