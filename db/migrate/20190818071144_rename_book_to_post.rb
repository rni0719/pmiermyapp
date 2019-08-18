class RenameBookToPost < ActiveRecord::Migration[5.2]
  def change
    rename_table :books, :posts
  end
end
