class AddSomeColumnInUserModel < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :teacher, :boolean
    add_column :users, :age, :integer
    add_column :users, :bio, :string
  end
end
