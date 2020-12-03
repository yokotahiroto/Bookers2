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
  
  def edit
    @user = User.find(params[:id])
    @user_new = User.new
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @user = User.new(user_params)
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
 
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
