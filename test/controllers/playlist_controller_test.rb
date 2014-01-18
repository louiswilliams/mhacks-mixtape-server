require 'test_helper'

class PlaylistControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get add_track" do
    get :add_track
    assert_response :success
  end

  test "should get remove_track" do
    get :remove_track
    assert_response :success
  end

  test "should get vote" do
    get :vote
    assert_response :success
  end

end
