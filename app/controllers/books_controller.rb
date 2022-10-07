class BooksController < ApplicationController
  def new
  end
  
  def create
    @book =Book.new(book_params)
    @book.save
    redirect_to "/index/:id"
  end
    
  def index
    @books =Book.all
  end
  
  def show
    @book = Book.find(params["id"])
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
