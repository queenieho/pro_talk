class Tag < ApplicationRecord
  validates_uniqueness_of :name
end
