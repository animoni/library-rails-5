require "test_helper"

class NewAuthorTest < ActionDispatch::IntegrationTest
  
  test 'Author should be saved in the table' do
    get new_author_path
    assert_difference 'Author.count', 1 do
      post authors_path, params:{author: {first_name: "Robin", last_name: "Cook"}}
    end
    follow_redirect!
    assert_template 'authors/index'
  end
  
  test 'Author should not be saved in the table ifa parameter is missing' do
    get new_author_path
    assert_no_difference 'Author.count' do
      post authors_path, params:{author: {first_name: "Robin", last_name: ""}}
    end
    assert_template 'authors/new'
  end
  
end

