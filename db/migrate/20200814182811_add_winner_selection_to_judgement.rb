class AddWinnerSelectionToJudgement < ActiveRecord::Migration[6.0]
  def change
    add_column :Judgements, :winner_selection, :string
  end
end
