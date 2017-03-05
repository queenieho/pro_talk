class UserReaction < ApplicationRecord
  belongs_to :user
  belongs_to :reaction
  belongs_to :story
end
