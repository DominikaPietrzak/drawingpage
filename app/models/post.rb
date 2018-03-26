class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  validates :title, presence: true, length: { minimum: 5}
  #paperclip
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  #favorite
  scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }
end
