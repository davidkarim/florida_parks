class AddNameToParks < ActiveRecord::Migration
  def change
    add_index :parks, :name
  end
end
