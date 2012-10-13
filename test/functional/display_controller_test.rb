require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
	assert_select '#columns #side a', minimum: 4
	assert_select '#main .entry', 3
	assert_select 'h3', 'Session 5'
  end

    test "markup needed for store.js.coffee is in place" do
    get :index
    assert_select '.display .entry > img', 3
    assert_select '.entry input[type=submit]', 3
  end

end


end
