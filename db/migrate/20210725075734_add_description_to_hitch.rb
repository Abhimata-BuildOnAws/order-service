class AddDescriptionToHitch < ActiveRecord::Migration[6.1]
  def change
    add_column :hitches, :description, :text
  end
end
