class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  has_one :karyawan
  has_many :clocks

  validates :username, presence:true, uniqueness: {case_sensitive: false}
  validates :admin, inclusion: {in: [true, false]}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password

  enum role: { user: 0 , admin: 1 }
  after_initialize :set_default_role, if: :new_record?

  private
  
  def set_default_role
    self.role ||= :user
  end

end
