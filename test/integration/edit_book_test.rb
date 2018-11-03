require 'test_helper'

class EditBookTest < ActionDispatch::IntegrationTest
  
  def setup
    @book_one = books(:one)
  end
  
  test 'book can not be edited due to wrong parameters' do
    get edit_book_path(@book_one)
    assert_template 'books/edit'
    patch book_path(@book_one), params: {book: {title:  "", description: ""}}
    assert_template 'books/edit'
  end
  
  test 'book can be edited with the right parameters' do
    get edit_book_path(@book_one)
    assert_template 'books/edit'
    patch book_path(@book_one), params: {book: {title:  "candide", description: "the play"}}
    follow_redirect!
    assert_template 'books/index'
  end
end