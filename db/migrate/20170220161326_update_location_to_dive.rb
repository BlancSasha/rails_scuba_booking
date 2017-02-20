class UpdateLocationToDive < ActiveRecord::Migration[5.0]
  def change
    change_column :dives, :location, :string
    remove_column :dives, :rating
    remove_column :dives, :disponibility
    rename_column :dives, :level_required, :depth_required
    add_column :users, :max_depth, :integer
    add_column :users, :name, :string
    add_column :users, :level, :integer
  end
end
