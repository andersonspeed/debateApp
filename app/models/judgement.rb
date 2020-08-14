class Judgement < ApplicationRecord
  belongs_to :owner, class_name: :User
  belongs_to :winner, class_name: :User, optional: true
  belongs_to :loser, class_name: :User, optional: true
  belongs_to :topic

  def determineWinner
    if self.winner_selection.eql?("creator")
      self.winner = self.topic.owner
      self.loser = self.topic.challenger
    else
      self.winner = self.topic.challenger
      self.loser = self.topic.owner
    end
    self.save
  end
end
