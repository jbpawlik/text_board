class AddUsernameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :username, :string
    add_column :posts, :author, :string
  end
end
