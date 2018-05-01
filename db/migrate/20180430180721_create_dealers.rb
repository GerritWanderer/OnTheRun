class CreateDealers < ActiveRecord::Migration[5.2]
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :state
      t.string :phone
      t.decimal :lat, precision: 13, scale: 9
      t.decimal :lon, precision: 13, scale: 9
      t.string :source_id
      t.string :source
      t.timestamps
      t.datetime :last_migrated_at
    end
  end
end
