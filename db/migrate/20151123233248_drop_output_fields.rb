class DropOutputFields < ActiveRecord::Migration
  def change
  	drop_table :output_fields
  end
end
