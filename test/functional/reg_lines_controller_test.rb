require 'test_helper'

class RegLinesControllerTest < ActionController::TestCase
  setup do
    @reg_line = reg_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reg_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reg_line" do
    assert_difference('RegLine.count') do
      post :create, reg_line: events(:ruby).id
    end

    assert_redirected_to holder_path(assigns(:reg_line).holder)
  end

  test "should show reg_line" do
    get :show, id: @reg_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reg_line
    assert_response :success
  end

  test "should update reg_line" do
    put :update, id: @reg_line, reg_line: @reg_line.attributes
    assert_redirected_to reg_line_path(assigns(:reg_line))
  end

  test "should destroy reg_line" do
    assert_difference('RegLine.count', -1) do
      delete :destroy, id: @reg_line
    end

    assert_redirected_to reg_lines_path
  end
end
