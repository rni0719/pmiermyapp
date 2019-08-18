class AddAssociationToSomeTables < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :integer, index: true
    add_column :post_comments, :user_id, :integer, index: true
    add_column :post_comments, :post_id, :integer, index: true
  end
end
