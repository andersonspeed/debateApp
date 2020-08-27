class Topic < ApplicationRecord
  belongs_to :owner, class_name: :User
  belongs_to :category
  belongs_to :challenger, class_name: :User, optional: true
  has_many :comments, foreign_key: :topic_id
  has_many :judgements, foreign_key: :topic_id
  belongs_to :currentCommenter, class_name: :User, optional: true
  validates :numReplies, presence: true, numericality: { only_integer: true }
  validates :wager, presence: true, numericality: true

  def startDebate
    self.open = false
    self.active = true
    self.complete = false
    self.replyCount = 0
    self.currentCommenter = self.challenger
    self.save
  end

  def updateCurrentCommenter
    if self.currentCommenter == self.owner
      self.currentCommenter= self.challenger
    else
      self.currentCommenter = self.owner
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
    self.complete = true
    self.judging  = true
    self.save
  end
end
