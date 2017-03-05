class Tag < ApplicationRecord
  validates_uniqueness_of :name

  def to_json
    { id: id, name: name }
  end
end
