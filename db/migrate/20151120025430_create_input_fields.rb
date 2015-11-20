class CreateInputFields < ActiveRecord::Migration
  def change
    create_table :input_fields do |t|
      t.string :name
      t.string :tag

      t.timestamps null: false
    end
  end
end
