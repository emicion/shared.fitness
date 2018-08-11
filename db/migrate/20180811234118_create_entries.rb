class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.datetime :time_stamp
      t.float :units

      t.timestamps
    end
  end
end
