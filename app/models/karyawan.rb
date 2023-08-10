class Karyawan < ApplicationRecord
  validates :name, presence: true, length: {minimum: 1, maximum: 100}
  validates :age, presence: true
  validates :address, presence: true, length: {minimum: 1}

  belongs_to :position
  belongs_to :user, foreign_key: 'user_id', class_name: 'User', optional: true
  has_many :clocks

  self.primary_key = :id
  before_create :generate_uuid
  after_create :share_karyawan_data

  #FUNCTION HELPER HERE
  def generate_uuid
    self.id ||= SecureRandom.uuid
  end

  def share_karyawan_data
    User.where.not(id: user_id).each do |other_user|
      other_user.create_karyawan(attributes.merge(user: other_user))
    end
  end
  #END OF HELPER

end
