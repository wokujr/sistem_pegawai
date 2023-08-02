class Karyawan < ApplicationRecord
  has_one :salary
  has_one :position, through: :salary
  has_many :salaries

  self.primary_key = :id
  before_create :generate_uuid
  def generate_uuid
    self.id ||= SecureRandom.uuid
  end
end
