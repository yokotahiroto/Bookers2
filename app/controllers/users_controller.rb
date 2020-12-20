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
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)  
    end
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @user = User.new(user_params)
    @user.create(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: 'You have create user successfully'
    else
      render :root
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: 'You have update user successfully'
    else
      render :edit
    end
  end
   
  def following
    @user  = User.find(params[:id])
    render 'show_follow'
  end

  def follower
    @user  = User.find(params[:id])
    render 'show_follower'
  end

 
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
