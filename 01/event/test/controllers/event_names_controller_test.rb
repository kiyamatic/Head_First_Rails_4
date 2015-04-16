require 'test_helper'

class EventNamesControllerTest < ActionController::TestCase
  setup do
    @event_name = event_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_name" do
    assert_difference('EventName.count') do
      post :create, event_name: { artist: @event_name.artist, description: @event_name.description, event_date: @event_name.event_date, price_high: @event_name.price_high, price_low: @event_name.price_low }
    end

    assert_redirected_to event_name_path(assigns(:event_name))
  end

  test "should show event_name" do
    get :show, id: @event_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_name
    assert_response :success
  end

  test "should update event_name" do
    patch :update, id: @event_name, event_name: { artist: @event_name.artist, description: @event_name.description, event_date: @event_name.event_date, price_high: @event_name.price_high, price_low: @event_name.price_low }
    assert_redirected_to event_name_path(assigns(:event_name))
  end

  test "should destroy event_name" do
    assert_difference('EventName.count', -1) do
      delete :destroy, id: @event_name
    end

    assert_redirected_to event_names_path
  end
end
