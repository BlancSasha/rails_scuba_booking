class CreateDives < ActiveRecord::Migration[5.0]
  def change
    create_table :dives do |t|
      t.integer :location
      t.integer :rating
      t.datetime :disponibility
      t.integer :capacity
      t.integer :price
      t.integer :level_required
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
