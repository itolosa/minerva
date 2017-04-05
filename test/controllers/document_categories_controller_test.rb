require 'test_helper'

class DocumentCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_category = document_categories(:one)
  end

  test "should get index" do
    get document_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_document_category_url
    assert_response :success
  end

  test "should create document_category" do
    assert_difference('DocumentCategory.count') do
      post document_categories_url, params: { document_category: { description: @document_category.description, name: @document_category.name } }
    end

    assert_redirected_to document_category_url(DocumentCategory.last)
  end

  test "should show document_category" do
    get document_category_url(@document_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_category_url(@document_category)
    assert_response :success
  end

  test "should update document_category" do
    patch document_category_url(@document_category), params: { document_category: { description: @document_category.description, name: @document_category.name } }
    assert_redirected_to document_category_url(@document_category)
  end

  test "should destroy document_category" do
    assert_difference('DocumentCategory.count', -1) do
      delete document_category_url(@document_category)
    end

    assert_redirected_to document_categories_url
  end
end
