require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @book_two = books(:two)
  end
  
  test "should get index" do
    get books_path
    assert_response :success
  end

  test "should get show" do
    get book_path(@book_two)
    assert_response :success
  end

  test "should get new" do
    get new_book_path
    assert_response :success
  end

  test "should get create" do
    
    assert_difference('Book.count', 1) do
      post books_path, params: {book: {title: "Faust", description: "How not to be Romeo and Juliet"}}
    end
    assert_equal 3, Book.all.size
  end

  test "should get update" do
    patch book_path(@book_two), params: { book: { title: "Never to read" } }
    assert_redirected_to book_path(@book_two)
    # Reload association to fetch updated data and assert that title is updated.
    @book_two.reload
    assert_equal "Never to read", @book_two.title
  end

  test "should get edit" do
    get edit_book_path(@book_two)
    assert_response :success
  end

  test "should get destroy" do
    assert_difference('Book.count', -1) do
      delete book_path(@book_two)
    end
    assert_redirected_to books_path
  end

end
