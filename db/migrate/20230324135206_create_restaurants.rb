class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :phone_number
      t.references :user, null: false, foreign_key: true
      t.datetime :opens_at
      t.datetime :closes_at

      t.timestamps
    end
  end
end
