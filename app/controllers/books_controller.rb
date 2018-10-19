class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
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

  def update
  end

  def edit
  end

  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :description)
  end
end
