class CalculatorsInputFieldsJoinTable < ActiveRecord::Migration
  def change
  	create_table :calculators_input_fields, id: false do |t|
  		t.integer :calculator_id
  		t.integer :input_field_id
  	end
  	
  	add_index :calculators_input_fields, :calculator_id
  	add_index :calculators_input_fields, :input_field_id
  end
end
