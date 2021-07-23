class RemoveMenuItemsColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :description
    remove_column :menu_items, :created_at 
    remove_column :menu_items, :updated_at
  end
end
