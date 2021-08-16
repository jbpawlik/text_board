class AddPostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :body, :string
      t.column :board_id, :integer
      t.timestamps
    end
    add_foreign_key :posts, :boards
  end
end
