class CreateEmissionRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :emission_records do |t|

      t.timestamps

      t.datetime :month
      t.integer :carbon_emission
      t.integer :carbon_emission_saved
      t.integer :effective_carbon_emission
      t.integer :number_of_tumpang
      t.integer :average_carbon_emission
    end
  end
end
