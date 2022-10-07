class BooksController < ApplicationController
  def new
  end
  
  def create
    @book =Book.new(book_params)
    @book.save
    redirect_to "/"
  end
    
  def index
    @books =Book.all
  end
  
  def show
  end

  def edit
  end
  
  def destroy
  end
 
  private
  
  def book_params
  params.permit(:title, :body)
  end

end
