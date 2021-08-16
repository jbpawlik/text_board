class AddBoardsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.column :name, :string
    end
  end
end
