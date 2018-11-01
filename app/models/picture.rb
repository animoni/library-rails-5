class Picture < ApplicationRecord
  
  def self.random_photo
   # binding.pry
    pic = Unsplash::Photo.random(count: 2)
    
    @picture = []
      pic.each do |a|
      @picture << a.urls.small
    end
    @picture.join(" ")
  end  
  
  def self.search_photo(name)
   # binding.pry
    pic = Unsplash::Photo.search("#{name}")
    @picture = []
      pic.each do |a|
      @picture << a.urls.small
    end
    @picture.join 
  end
end