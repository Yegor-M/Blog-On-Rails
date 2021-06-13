class AddUserIdToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :integer
    remove_column :comments, :user
    add_column :comments, :user_id, :integer
  end
end
