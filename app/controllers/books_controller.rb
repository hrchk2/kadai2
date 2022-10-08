class BooksController < ApplicationController
  def new
  end
  
  def create
    @book =Book.new(book_params)
    @book.save
    render("books/show")
  end
    
  def index
    @books =Book.all.order(id: :asc)
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
  end
 
  private
  
  def book_params
  params.require(:book).permit(:title, :body)
  end

end
