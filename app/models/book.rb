class Book < ApplicationRecord
   
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
