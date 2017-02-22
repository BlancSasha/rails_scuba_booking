class AddCoordinatesToDives < ActiveRecord::Migration[5.0]
  def change
    add_column :dives, :latitude, :float
    add_column :dives, :longitude, :float
  end
end
