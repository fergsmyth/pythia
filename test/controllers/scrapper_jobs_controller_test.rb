require 'test_helper'

class ScrapperJobsControllerTest < ActionController::TestCase
  setup do
    @scrapper_job = scrapper_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrapper_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrapper_job" do
    assert_difference('ScrapperJob.count') do
      post :create, scrapper_job: {  }
    end

    assert_redirected_to scrapper_job_path(assigns(:scrapper_job))
  end

  test "should show scrapper_job" do
    get :show, id: @scrapper_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrapper_job
    assert_response :success
  end

  test "should update scrapper_job" do
    patch :update, id: @scrapper_job, scrapper_job: {  }
    assert_redirected_to scrapper_job_path(assigns(:scrapper_job))
  end

  test "should destroy scrapper_job" do
    assert_difference('ScrapperJob.count', -1) do
      delete :destroy, id: @scrapper_job
    end

    assert_redirected_to scrapper_jobs_path
  end
end
