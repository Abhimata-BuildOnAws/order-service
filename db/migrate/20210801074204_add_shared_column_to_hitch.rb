class AddSharedColumnToHitch < ActiveRecord::Migration[6.1]
  def change
    add_column :hitches, :shared?, :boolean
  end
end
