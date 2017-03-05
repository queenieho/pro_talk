class Story < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  belongs_to :age_range, optional: true
  belongs_to :relationship_to_abortion, optional: true
  belongs_to :gender, optional: true

  scope :published, -> { where(published: true) }

  def to_json
    {
      id: id,
      title: title,
      content: content,
      age_range: age_range.to_json,
      gender: gender.to_json,
      relationship_to_abortion: relationship_to_abortion.to_json
    }
  end
end
