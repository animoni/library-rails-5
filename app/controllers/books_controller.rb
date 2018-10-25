class BooksController < ApplicationController
 
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  def random_photo
    pic = Unsplash::Photo.random(query: "cat",count: 1)
    #binding.pry
    @picture = [].join 
      pic.each do |a|
      @picture << a.urls.small
    end
    @picture
  end
end
