class AddDetailsToTopic < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :open, :boolean
    add_column :topics, :active, :boolean
    add_column :topics, :complete, :boolean
  end
end
