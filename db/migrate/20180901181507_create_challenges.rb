class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.references :competition, foreign_key: true
      t.string :name
      t.text :description
      t.float :value

      t.timestamps
    end
  end
end
