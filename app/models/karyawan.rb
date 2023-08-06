class Karyawan < ApplicationRecord
  validates :nama, presence: true, length: {minimum: 1, maximum: 100}
  validates :usia, presence: true, nil: false
  validates :alamat, presence: true, length: {minimum: 1}

  has_many :positions
  accepts_nested_attributes_for :positions

  self.primary_key = :id
  before_create :generate_uuid
  def generate_uuid
    self.id ||= SecureRandom.uuid
  end
end
