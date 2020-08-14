class AddJudgingtoTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :judging, :boolean
    add_reference :topics, :winner, references: :users, index: true
    add_foreign_key :topics, :users, column: :winner_id

    add_reference :topics, :loser, references: :users, index: true
    add_foreign_key :topics, :users, column: :loser_id

    add_column :topics, :owner_votecount, :int
    add_column :topics, :challenger_votecount, :int

  end
end
