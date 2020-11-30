class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(post_image_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path
  end

  def index
  end
  
  def show
  end
  
  def destroy
  end
end
