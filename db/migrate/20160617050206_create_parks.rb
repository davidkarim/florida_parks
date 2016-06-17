class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :description
      t.string :link
      t.string :park_url

      t.timestamps null: false
    end
  end
end
