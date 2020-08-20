class AddChallengerToTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :challenger, references: :users, index: true

    add_foreign_key :topics, :users, column: :challenger_id
  end
end
