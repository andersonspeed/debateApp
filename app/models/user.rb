class User < ApplicationRecord
  has_many :topics, foreign_key: :owner_id, dependent: :destroy
  has_many :challenger_topics, class_name: :Topic, foreign_key: :challenger_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
