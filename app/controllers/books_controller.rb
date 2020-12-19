class BooksController < ApplicationController
   
  def new
    @book = Book.new
  end

  def create
    @books = Book.all 
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have create book successfully'
    else
      render :'users/show'
    end
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
    @book_comment = BookComment.new
  end
  
  def edit 
    @book = Book.find(params[:id])
    if @book.user == current_user
       render "edit"
    else
       redirect_to books_path
    end
  end
  
  def update
    @user = current_user 
    @book = Book.find(params[:id])
    @book.update(book_params)
    @book.user_id = current_user.id
    if @book.save
        redirect_to book_path(@book.id), notice:'You have update book successfully'
    else
        render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
