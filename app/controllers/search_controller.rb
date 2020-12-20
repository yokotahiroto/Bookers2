class SearchController < ApplicationController
  
  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word] 
    
    if @range == '1'
      if search == "forward_match"
         @users = User.where("name LIKE ?", "#{word}%") 
      elsif search == "backward_match" 
         @users = User.where("name LIKE ?", "%#{word}")
      elsif search == "perfect_match"
         @users = User.where("name LIKE ?", "#{word}")
      elsif search == "partial_match"
         @users = User.where("name LIKE ?", "%#{word}%")
      else
         @users = User.all 
      end
     
    else
      if search == "forward_match"
         @books = Book.where("title LIKE ?", "#{word}%") 
      elsif search == "backward_match"
         @books = Book.where("title LIKE ?", "%#{word}")
      elsif search == "perfect_match" 
         @books = Book.where("title LIKE ?", "#{word}")
      elsif search == "partial_match"
         @books = Book.where("title LIKE ?", "%#{word}%")
      else
         @books = Book.all 
      end
      
    end
  end
end
