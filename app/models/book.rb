class Book < ActiveRecord::Base
  validates :author, :title, :isbn, presence: true

  attr_accessible :author, :isbn, :title, :avatar
  mount_uploader :avatar, AvatarUploader

  belongs_to :user

end
