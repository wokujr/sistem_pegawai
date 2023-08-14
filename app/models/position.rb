class Position < ApplicationRecord
  has_many :karyawans, through: :employee_categories
  has_many :employee_categories
end
