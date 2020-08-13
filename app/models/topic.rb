class Topic < ApplicationRecord
  belongs_to :owner, class_name: :User
  belongs_to :category
  belongs_to :challenger, class_name: :User, optional: true
  has_many :comments

  validates :numReplies, presence: true, numericality: { only_integer: true }
  validates :wager, presence: true, numericality: true

  def startDebate
    self.open = true;
    self.active = false;
    self.complete = false;
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

end
