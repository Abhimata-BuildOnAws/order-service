class AddTravelDistanceToHitch < ActiveRecord::Migration[6.1]
  def change
    add_column :hitches, :travel_distance, :integer
  end
end
