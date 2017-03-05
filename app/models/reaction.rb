class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :story
end
