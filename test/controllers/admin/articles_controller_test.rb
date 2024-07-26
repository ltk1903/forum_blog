require "test_helper"

class Admin::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_articles_index_url
    assert_response :success
  end
end
