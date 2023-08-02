class Karyawan < ApplicationRecord

  has_one :salary, inverse_of: :karyawan
  has_one :position, through: :salary

  accepts_nested_attributes_for :salary, allow_destroy: true

  self.primary_key = :id
  before_create :generate_uuid
  def generate_uuid
    self.id ||= SecureRandom.uuid
  end
end
