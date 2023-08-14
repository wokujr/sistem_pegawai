class Karyawan < ApplicationRecord
  validates :name, presence: true, length: {minimum: 1, maximum: 100}
  validates :age, presence: true
  validates :address, presence: true, length: {minimum: 1}

  belongs_to :user, foreign_key: 'user_id', class_name: 'User', optional: true
  has_many :clocks
  has_many :employee_categories
  has_many :positions, through: :employee_categories

  self.primary_key = :id
  before_create :generate_uuid

  #FUNCTION HELPER HERE
  def generate_uuid
    self.id ||= SecureRandom.uuid
  end
  #END OF HELPER

end
