class UpdateMonthEmissionRecord < ActiveRecord::Migration[6.1]
  def change
    change_column :emission_records, :month, :string
  end
end
