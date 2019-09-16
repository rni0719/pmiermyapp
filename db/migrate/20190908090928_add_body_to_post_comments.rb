class AddBodyToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :body, :text
  end
end
