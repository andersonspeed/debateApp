class AddDetailsToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :numReplies, :int
    add_column :topics, :wager, :decimal
  end
end
