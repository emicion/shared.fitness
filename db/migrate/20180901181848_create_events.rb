class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true
      t.float :performed
      t.float :value

      t.timestamps
    end
  end
end
