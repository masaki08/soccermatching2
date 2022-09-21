class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :customer
  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
