class Comment < ApplicationRecord
  validates :body, presence: true#空白データの保存を禁止
  belongs_to :customer
  belongs_to :post
end
