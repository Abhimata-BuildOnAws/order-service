class RemoveColumnsFromRestaurant < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :created_at
    remove_column :restaurants, :updated_at
    remove_column :restaurants, :email
    remove_column :restaurants, :contact_no
  end
end