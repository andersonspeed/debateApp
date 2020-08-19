class Topic < ApplicationRecord
  belongs_to :owner, class_name: :User
  belongs_to :category
  belongs_to :challenger, class_name: :User, optional: true
  has_many :comments, foreign_key: :topic_id
  has_many :judgements, foreign_key: :topic_id
  belongs_to :current_commenter, class_name: :User, optional: true
  validates :numReplies, presence: true, numericality: { only_integer: true }
  validates :wager, presence: true, numericality: true

  def startDebate
    self.open = false
    self.active = true
    self.complete = false
    self.replyCount = 0
    self.current_commenter = self.challenger
    self.save
  end

  def updateCurrentCommenter
    if self.current_commenter == self.owner
      self.current_commenter= self.challenger
    else
      self.current_commenter = self.owner
    end
    self.save
  end

  def addComment
    self.replyCount = self.replyCount + 1
    if self.replyCount == self.numReplies
      self.sendDebateToJudging
    end
    self.save
  end

  def sendDebateToJudging
    self.active = false
    self.judging  = true
    self.save
  end
end
