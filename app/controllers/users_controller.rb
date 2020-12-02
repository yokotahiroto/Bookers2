class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def new
    @book = Book.new
  end
  
  def create
  end
  
 
  private

  def user_params
    params.require(:user_id).permit(:name)
  end
end
