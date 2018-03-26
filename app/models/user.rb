class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :favorite_posts, dependent: :destroy
  enum role: {guest: 0, commonuser:1, admin:2, superadmin:3 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def favorite(post)
    favorite_posts.find_or_create_by(post: post)
  end

  def unfavorite(post)
    favorite_posts.where(post: post).destroy_all

    post.reload
  end
end
