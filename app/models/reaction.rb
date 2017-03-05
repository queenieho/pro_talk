class Reaction < ApplicationRecord
  belongs_to :user, through :user_reactions
  belongs_to :story, through :user_reactions
end
