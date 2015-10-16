require 'test_helper'

class GameweeksControllerTest < ActionController::TestCase
  setup do
    @gameweek = gameweeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gameweeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gameweek" do
    assert_difference('Gameweek.count') do
      post :create, gameweek: {  }
    end

    assert_redirected_to gameweek_path(assigns(:gameweek))
  end

  test "should show gameweek" do
    get :show, id: @gameweek
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gameweek
    assert_response :success
  end

  test "should update gameweek" do
    patch :update, id: @gameweek, gameweek: {  }
    assert_redirected_to gameweek_path(assigns(:gameweek))
  end

  test "should destroy gameweek" do
    assert_difference('Gameweek.count', -1) do
      delete :destroy, id: @gameweek
    end

    assert_redirected_to gameweeks_path
  end
end
