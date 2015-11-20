class CreateOutputFields < ActiveRecord::Migration
  def change
    create_table :output_fields do |t|
      t.string :name
      t.string :tag

      t.timestamps null: false
    end
  end
end
