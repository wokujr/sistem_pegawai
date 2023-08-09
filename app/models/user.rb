class User < ApplicationRecord
  has_one :karyawan
  has_many :clocks

  validates :username, presence:true, uniqueness: {case_sensitive: false}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  
end
