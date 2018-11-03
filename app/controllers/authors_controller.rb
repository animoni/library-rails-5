class AuthorsController < ApplicationController
  
  def index
    @authors = Author.all
  end
  
  def show
    @author = Author.find(params[:id])
  end
  
  def new
    @author = Author.new
  end
  
  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "New author added."
      redirect_to author_path(@author.id)
    else
      flash[:danger] = "Did you cheked the spelling?"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @author = Author.find(params[:id])
    @author.delete
    redirect_to authors_path
  end
  
  private
  
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
