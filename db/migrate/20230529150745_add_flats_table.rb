class AddFlatsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :address
      t.string :description
      t.integer :price_per_day
      t.string :availability
      t.string :photos_id
      t.string :guests_allowed
      t.timestamps
    end
  end
end
