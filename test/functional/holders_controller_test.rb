require 'test_helper'

class HoldersControllerTest < ActionController::TestCase
  setup do
    @holder = holders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:holders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create holder" do
    assert_difference('Holder.count') do
      post :create, holder: @holder.attributes
    end

    assert_redirected_to holder_path(assigns(:holder))
  end

  test "should show holder" do
    get :show, id: @holder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @holder
    assert_response :success
  end

  test "should update holder" do
    put :update, id: @holder, holder: @holder.attributes
    assert_redirected_to holder_path(assigns(:holder))
  end

  test "should destroy holder" do
    assert_difference('Holder.count', -1) do
      delete :destroy, id: @holder
    end

    assert_redirected_to holders_path
  end
end
