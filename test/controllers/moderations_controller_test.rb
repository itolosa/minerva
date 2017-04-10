require 'test_helper'

class ModerationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moderation = moderations(:one)
  end

  test "should get index" do
    get moderations_url
    assert_response :success
  end

  test "should get new" do
    get new_moderation_url
    assert_response :success
  end

  test "should create moderation" do
    assert_difference('Moderation.count') do
      post moderations_url, params: { moderation: { create: @moderation.create, destroy: @moderation.destroy, edit: @moderation.edit, index: @moderation.index, new: @moderation.new, show: @moderation.show, update: @moderation.update } }
    end

    assert_redirected_to moderation_url(Moderation.last)
  end

  test "should show moderation" do
    get moderation_url(@moderation)
    assert_response :success
  end

  test "should get edit" do
    get edit_moderation_url(@moderation)
    assert_response :success
  end

  test "should update moderation" do
    patch moderation_url(@moderation), params: { moderation: { create: @moderation.create, destroy: @moderation.destroy, edit: @moderation.edit, index: @moderation.index, new: @moderation.new, show: @moderation.show, update: @moderation.update } }
    assert_redirected_to moderation_url(@moderation)
  end

  test "should destroy moderation" do
    assert_difference('Moderation.count', -1) do
      delete moderation_url(@moderation)
    end

    assert_redirected_to moderations_url
  end
end
