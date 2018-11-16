require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get login" do
    get static_pages_login_url
    assert_response :success
  end

  test "should get application" do
    get static_pages_application_url
    assert_response :success
  end

  test "should get createaccount" do
    get static_pages_createaccount_url
    assert_response :success
  end

  test "should get updateaccount" do
    get static_pages_updateaccount_url
    assert_response :success
  end

  test "should get updateworker" do
    get static_pages_updateworker_url
    assert_response :success
  end

  test "should get userhome" do
    get static_pages_userhome_url
    assert_response :success
  end

  test "should get workerhome" do
    get static_pages_workerhome_url
    assert_response :success
  end

  test "should get adminhome" do
    get static_pages_adminhome_url
    assert_response :success
  end

  test "should get workerlogin" do
    get static_pages_workerlogin_url
    assert_response :success
  end

  test "should get adminlogin" do
    get static_pages_adminlogin_url
    assert_response :success
  end

  test "should get viewapplicants" do
    get static_pages_viewapplicants_url
    assert_response :success
  end

  test "should get viewjobs" do
    get static_pages_viewjobs_url
    assert_response :success
  end

  test "should get invoice" do
    get static_pages_invoice_url
    assert_response :success
  end

  test "should get joblaunch" do
    get static_pages_joblaunch_url
    assert_response :success
  end

  test "should get jobrequest" do
    get static_pages_jobrequest_url
    assert_response :success
  end

  test "should get closejobs" do
    get static_pages_closejobs_url
    assert_response :success
  end

end
