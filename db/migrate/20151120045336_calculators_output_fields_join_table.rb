class CalculatorsOutputFieldsJoinTable < ActiveRecord::Migration
  def change
  	create_table :calculators_output_fields, id: false do |t|
  		t.integer :calculator_id
  		t.integer :output_field_id
  	end
  	
  	add_index :calculators_output_fields, :calculator_id
  	add_index :calculators_output_fields, :output_field_id
  end
end
