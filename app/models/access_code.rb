class AccessCode < ApplicationRecord
  validates_uniqueness_of :email, uniqueness: true
  validates :code, length: { is: 16 }, uniqueness: true

  scope :unexpired, -> { where(expired: false) }

  def self.generate!(email)
    self.create!(email: email, code: SecureRandom.urlsafe_base64(12))
  end

  def expire!
    self.expired = true
    save!
  end

  def apply!
    self.applied = true
    save!
  end
end
