require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  
  test "requires item in holder" do
    get :new
    assert_redirected_to display_path
    assert_equal flash[:notice], 'No event chosen.'
  end


  test "should get new" do
    item = RegLine.new
	item.build_holder
	item.eventt = events(:ruby)
	item.save!
	session[:holder_id] = itemholder.id
	
	get :new
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, order: { address: @registration.address, email: @registration.email,
	    name: @registration.name }
    end

    assert_redirected_to display_path
  end
    end

    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration
    assert_response :success
  end

  test "should update registration" do
    put :update, id: @registration, registration: @registration.attributes
    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration
    end

    assert_redirected_to registrations_path
  end
end
