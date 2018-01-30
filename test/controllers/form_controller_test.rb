require 'test_helper'

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get form_main_url
    assert_response :success
  end

end
