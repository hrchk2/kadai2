class BooksController < ApplicationController
  def new
  end
  
  def create
    @book =Book.new(book_params)
    @books =Book.all.order(id: :asc)
    if @book.save
       redirect_to book_path(@book.id)
       flash[:notice] = "Book was successfully created."
    else
       render :index
    end
  end
    
  def index
    @books =Book.all.order(id: :asc)
    @book =Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end
 
  private
  
  def book_params
  params.require(:book).permit(:title, :body)
  end

end
