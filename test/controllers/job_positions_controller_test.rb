require "test_helper"

class JobPositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_positions_index_url
    assert_response :success
  end
end
