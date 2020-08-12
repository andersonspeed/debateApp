class Topic < ApplicationRecord
  belongs_to :owner, class_name: :User
  belongs_to :category
  belongs_to :challenger, class_name: :User, optional: true
  has_many :comments

  validates :numReplies, presence: true, numericality: { only_integer: true }
  validates :wager, presence: true, numericality: true

end
