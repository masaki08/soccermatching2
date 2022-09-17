class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :favorites, dependent: :destroy
 
  
  def favorited_by?(post_id)
    favorites.where(post_id: post_id).exists?
  end
end
