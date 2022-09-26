class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  

 # フォローするユーザーから見た中間テーブル
  has_many :active_relationships,
                      class_name: "Relationship",
                      foreign_key: "follower_id",
                      dependent: :destroy

  # フォローされているユーザーから見た中間テーブル
  has_many :passive_relationships,
                      class_name: "Relationship",
                      foreign_key: "followed_id",
                      dependent: :destroy

  # 中間テーブルactive_relationshipsを通って、フォローされる側(followed)を集める処理をfollowingsと命名
  # フォローしているユーザーの情報がわかるようになる
  has_many :followings, through: :active_relationships, source: :followed

  # 中間テーブルpassive_relationshipsを通って、フォローする側(follower)を集める処理をfollowingsと命名
  #　フォローされているユーザーの情報がわかるようになる
  has_many :followers, through: :passive_relationships, source: :follower

  #has_many :followings, through: :relationships, source: :followed
  #has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  def self.guest
     find_or_create_by!(email: 'guest@example.com') do |customer|
       customer.password = SecureRandom.urlsafe_base64
    end
  end

    # フォローする
  def follow(customer_id)
    active_relationships.create(followed_id: customer_id)
  end

  # フォローを外す
  def unfollow(customer_id)
    active_relationships.find_by(followed_id: customer_id).destroy
  end

  # すでにフォローしているのか確認
  def following?(customer)
    followings.include?(customer)
  end

  def followed_by?(customer)
    followers.include?(customer)
  end

  def favorited_by?(customer_id, post_id)
    Favorite.exists?(customer_id: customer_id, post_id: post_id)
  end
end