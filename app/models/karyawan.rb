class Karyawan < ApplicationRecord
  validates :name, presence: true, length: {minimum: 1, maximum: 100}
  validates :age, presence: true
  validates :address, presence: true, length: {minimum: 1}

  belongs_to :position
  belongs_to :user

  self.primary_key = :id
  before_create :generate_uuid
  def generate_uuid
    self.id ||= SecureRandom.uuid
  end

end
