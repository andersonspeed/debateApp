class AddReplycount < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :replyCount, :integer
  end
end
