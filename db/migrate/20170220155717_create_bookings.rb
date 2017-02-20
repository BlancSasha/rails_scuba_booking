class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :quantity
      t.integer :rating
      t.string :review
      t.string :status
      t.references :user, foreign_key: true
      t.references :dive, foreign_key: true

      t.timestamps
    end
  end
end
