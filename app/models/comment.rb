class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :owner, class_name: :User
end
