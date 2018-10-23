module BooksHelper
  
  def random_photo

    pic = Unsplash::Photo.random(query: "cat",count: 1)
    #binding.pry
    picture = [].join 
      pic.each do |a|
      picture << a.urls.small
    end
    picture
  end
  
  def search_photo(name)
    pic = Unsplash::Photo.search("#{name}")
    picture = [].join 
      pic.each do |a|
      picture << a.urls.small
    end
    picture
  end
  
end
