class CreateJoinTableCompetitionUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :competitions, :users do |t|
      # t.index [:competition_id, :user_id]
      # t.index [:user_id, :competition_id]
    end
  end
end
