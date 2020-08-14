class CreateJudgements < ActiveRecord::Migration[6.0]
  def change
    create_table :judgements do |t|
      t.text :opinion

      t.timestamps
    end
    add_reference :judgements, :owner, references: :users, index: true
    add_reference :judgements, :topic, references: :topics, index: true
    add_reference :judgements, :winner, references: :users, index: true
    add_reference :judgements, :loser, references: :users, index: true
  end
end
