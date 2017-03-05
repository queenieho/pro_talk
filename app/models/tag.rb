class Tag < ApplicationRecord
  validate_uniqueness_of :name
end
