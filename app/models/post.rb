class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :customer

  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

  # 投稿されているpostの中から自分がGoodしているものを探し出しidを返す
  def favorite_id?(customer)
    self.favorites.find_by(customer_id: customer.id)
  end
end
