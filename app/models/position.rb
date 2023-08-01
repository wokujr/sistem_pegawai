class Position < ApplicationRecord
  has_many :salaries
  has_many :karyawans, through: :salaries

end
