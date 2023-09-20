class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.date :sold_date
      t.string :property_type
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.decimal :price
      t.integer :beds
      t.integer :baths
      t.integer :square_feet
      t.integer :lot_size
      t.integer :year_built
      t.integer :days_on_market
      t.integer :monthly_hoa
      t.string :mls_number
      t.string :identifier
      t.float :latitude
      t.float :longitude
      t.text :description
      t.integer :upvotes_count
      t.integer :downvotes_count

      t.timestamps
    end
  end
end
