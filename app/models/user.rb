class User < ApplicationRecord
  has_one :karyawan, dependent: :destroy
  has_many :clocks

  validates :username, presence:true, uniqueness: {case_sensitive: false}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password

  self.primary_key = :id
  before_create :generate_uuid
  def generate_uuid
    self.id ||= SecureRandom.uuid
  end
end
