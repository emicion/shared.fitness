class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :unit
      t.float :value_per_unit

      t.timestamps
    end
  end
end
