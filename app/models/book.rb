require 'goodreads'

class Book < ActiveRecord::Base
  # validates :author, :title, :isbn, presence: true

  attr_accessible :author, :isbn, :title, :avatar
  mount_uploader :avatar, AvatarUploader

  before_create :isbn_lookup 
  

  belongs_to :user

  def isbn_lookup
      if self.isbn
        client = Goodreads::Client.new(:api_key => ENV["GOODREADS_KEY"], :api_secret => ENV["GOODREADS_SECRET"])
        result = client.book_by_isbn(self.isbn)
        self.author = result.authors.first[1].name
        self.title = result.title
        # self.avatar = result.image_url
      end
  end
end
