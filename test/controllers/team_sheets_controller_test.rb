require 'test_helper'

class TeamSheetsControllerTest < ActionController::TestCase
  setup do
    @team_sheet = team_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_sheet" do
    assert_difference('TeamSheet.count') do
      post :create, team_sheet: { name: @team_sheet.name }
    end

    assert_redirected_to team_sheet_path(assigns(:team_sheet))
  end

  test "should show team_sheet" do
    get :show, id: @team_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_sheet
    assert_response :success
  end

  test "should update team_sheet" do
    patch :update, id: @team_sheet, team_sheet: { name: @team_sheet.name }
    assert_redirected_to team_sheet_path(assigns(:team_sheet))
  end

  test "should destroy team_sheet" do
    assert_difference('TeamSheet.count', -1) do
      delete :destroy, id: @team_sheet
    end

    assert_redirected_to team_sheets_path
  end
end
