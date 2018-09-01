class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.references :owner, index: true, foreign_key: {to_table: :users}
      t.string :name
      t.boolean :public
      t.datetime :start
      t.datetime :stop

      t.timestamps
    end
  end
end
