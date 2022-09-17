class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :post_parmas
 validates_uniqueness_of :post_id, scope: :customer_id
end
