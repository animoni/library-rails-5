class Picture < ApplicationRecord
  
  def self.random_photo
   # binding.pry
    pic = Unsplash::Photo.random(count: 2)
    
    @picture = []
      pic.each do |a|
      @picture << a.urls.small
    end
    @picture
  end  
  
  def self.search_photo(name)
    # binding.pry
    pic = Unsplash::Photo.search(name['search_word'], 1, 10)
    # binding.pry
    @picture = []
    pic.each do |p|
      @picture << p.urls.thumb
    end
    @picture
   
  end
end