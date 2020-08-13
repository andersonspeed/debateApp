class Topic < ApplicationRecord
  belongs_to :owner, class_name: :User
  belongs_to :category
  belongs_to :challenger, class_name: :User, optional: true
  has_many :comments
  validates :numReplies, presence: true, numericality: { only_integer: true }
  validates :wager, presence: true, numericality: true

  def startDebate
    self.open = false
    self.active = true
    self.complete = false
    self.replyCount = 0
    self.currentCommenter_id = self.challenger_id
    self.save
  end

  def updateCurrentCommenter
    if self.currentCommenter_id == self.owner_id
      self.currentCommenter_id = self.challenger_id
    else
      self.currentCommenter_id = self.owner_id
    end
    self.save
  end

  def addComment
    self.replyCount = self.replyCount + 1
    if self.replyCount == self.numReplies
      self.endDebate
    end
    self.save
  end

  def endDebate
    self.active = false
    self.complete = true
    self.save
  end
end
