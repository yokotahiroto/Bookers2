class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    @user = User.find(params[:id])
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end
  
  def create
  end
  
 
  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end
end
