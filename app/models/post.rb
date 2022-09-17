class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  
  has_many :favorites, dependent: :destroy
  
  belongs_to :customer
end
