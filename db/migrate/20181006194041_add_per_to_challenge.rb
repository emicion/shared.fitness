class AddPerToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :per, :string
  end
end
