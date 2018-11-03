require 'test_helper'

class DeleteBookTest < ActionDispatch::IntegrationTest
  
  def setup
    @book_one = books(:one)
  end
  
  test 'when the delete button is used the book should be deleted' do
    
    get book_path(@book_one)
    assert_template 'books/show'
    assert_select 'a[href=?]', book_path(@book_one), text: 'Delete'
    
    assert_difference 'Book.count', -1 do
            delete book_path(@book_one)
        end
        follow_redirect!
        assert_template 'books/index'
  end
  
  
end