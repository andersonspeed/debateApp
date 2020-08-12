class AddCurrentCommenterToTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :currentCommenter, references: :users, index: true

    add_foreign_key :topics, :users, column: :currentCommenter_id

  end
end
