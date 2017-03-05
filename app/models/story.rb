class Story < ApplicationRecord
  belongs_to :user
  belongs_to :age_range, optional: true
  belongs_to :relationship_to_abortion, optional: true
  belongs_to :gender, optional: true
  
  has_and_belongs_to_many :tags
  has_many :reactions

  scope :published, -> { where(published: true) }
end

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
