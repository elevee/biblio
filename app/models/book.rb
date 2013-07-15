class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :title, :avatar
  mount_uploader :avatar, AvatarUploader

end
