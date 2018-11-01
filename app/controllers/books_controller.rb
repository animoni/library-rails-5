class BooksController < ApplicationController
 
  def index
   #@pic = Book.random_photo
  end

  def show
  end

  def new
  end

  def create 
    #redirect_to books_path
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  def search
   # binding.pry
    if search_params[:search_word].blank?
      @pic = Picture.random_photo
    else
      @pic = Picture.search_photo(search_params)
    end
  end
  
  private
  
  def search_params
    params.require(:search_params).permit(:search_word)
  end
 
end
