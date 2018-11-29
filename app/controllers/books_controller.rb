class BooksController < ApplicationController
 
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:success] = "New book added to list."
    else
      flash[:danger] = "Something is not quite right."
      render new_book_path
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.update_attributes(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "The edit was success."
    else
      flash[:notice] = "The edit was not really successful."
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
    flash[:danger] = "OH WHY?!"
  end
  
  def search
   # binding.pry
    if search_params[:search_word].blank?
      @pic = Picture.random_photo
    else
      @pic = Picture.search_photo(search_params)
    end
  end
  
  # def picture
  #   @bookpicture = BookPicture.new(pic_parmas)
    
    
  # end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :description)
  end
  
  def search_params
    params.require(:search_params).permit(:search_word)
  end
  
  # def pic_parmas
  #   params.require(:picture).permit(:chosen_picture)
  # end
 
end
