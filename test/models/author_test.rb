require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  
  test 'when the first and last name is present with letters, it should be saved' do
    author = Author.new(first_name: "Robin", last_name: "Cook")
    assert author.valid?
  end
  
  test 'when the first name is present with letters but not the last name, it should not be saved' do
    author = Author.new(first_name: "Robin", last_name: "")
    assert_not author.valid?
  end
  
  test 'when the last name is present with letters but not the first name, it should not be saved' do
    author = Author.new(first_name: "", last_name: "Cook")
    assert_not author.valid?
  end
  
  test 'when the first name and last name is present but contains numbers, it should not be saved' do
    author = Author.new(first_name: "Robin", last_name: "C00k")
    assert_not author.valid?
  end
  
  test 'when both names are missing it should not be saved' do
    author = Author.new(first_name: "", last_name: "")
    assert_not author.valid?
  end
end
