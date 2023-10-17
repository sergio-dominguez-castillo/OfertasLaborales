class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :position, :string
    add_column :users, :note, :text
    add_column :users, :role, :integer, default: 0
  end
end
