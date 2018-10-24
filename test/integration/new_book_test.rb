require 'test_helper'

class NewBookTest < ActionDispatch::IntegrationTest
  
 
  
  test 'when title is missing, it should not be saved to the db' do
    get new_book_path
    assert_template 'books/new'
    assert_no_difference 'Book.count' do 
      post books_path, params: { book: {title: "", description: "Fear of clowns"}}
    end
    assert_template 'books/new'
  end
  
  test 'when description is missing, it should not be saved to the db' do
    get new_book_path
    assert_template 'books/new'
    assert_no_difference 'Book.count' do 
      post books_path, params: { book: {title: "IT", description: ""}}
    end
    assert_template 'books/new'
  end
  
  test 'when nothing is missing, it should be saved to the db' do
    get new_book_path
    assert_template 'books/new'
    assert_difference 'Book.count', 1 do 
      post books_path, params: { book: {title: "IT", description: "Fear of clowns"}}
    end
    follow_redirect!
    assert_template 'books/show'
  end
  
end