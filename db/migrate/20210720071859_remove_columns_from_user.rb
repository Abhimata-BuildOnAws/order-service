class RemoveColumnsFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name
    remove_column :users, :created_at
    remove_column :users, :updated_at
    remove_column :users, :email
    remove_column :users, :street
    remove_column :users, :state
    remove_column :users, :country
    remove_column :users, :latitude
    remove_column :users, :longitude
  end
end
