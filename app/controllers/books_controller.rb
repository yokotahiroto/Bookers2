class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @user = current_user 
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book_show = Book.find(params[:id])
    @user = @book_show.user
    @book = Book.new
    @book_edit = Book.find(params[:id])
  end
  
  def edit 
    @book = Book.find(params[:id])
  end
  
  def destroy
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
