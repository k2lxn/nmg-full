class AddOptionsToInputFields < ActiveRecord::Migration
  def change
  	add_column :input_fields, :options, :string
  end
end
