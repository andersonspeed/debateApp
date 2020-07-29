class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
    end
    add_column :comments, :content, :text
    add_reference :comments, :owner, references: :users, index: true
    add_reference :comments, :topic, references: :topics, index: true

  end
end
