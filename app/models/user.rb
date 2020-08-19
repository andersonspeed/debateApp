class User < ApplicationRecord
  has_many :topics, foreign_key: :owner_id, dependent: :destroy
  has_many :challenger_topics, class_name: :Topic, foreign_key: :challenger_id
  has_many :currentcommenter_topics, class_name: :Topic, foreign_key: :currentCommenter_id
  has_many :winner_topics, class_name: :Topic, foreign_key: :winner_id
  has_many :loser_topics, class_name: :Topic, foreign_key: :loser_id

  has_many :judgements, foreign_key: :owner_id
  has_many :winner_judgements, class_name: :Judgement, foreign_key: :winner_id
  has_many :loser_judgements, class_name: :Judgement, foreign_key: :loser_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
