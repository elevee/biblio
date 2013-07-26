class AddCoverArtToBooks < ActiveRecord::Migration
  def change
    add_column :books, :cover_art, :string
  end
end
