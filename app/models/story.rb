class Story < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  scope :published, -> { where(published: true) }
end

