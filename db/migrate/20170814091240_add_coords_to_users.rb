class AddCoordsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
