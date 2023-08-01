class Salary < ApplicationRecord
  belongs_to :karyawan
  belongs_to :position
end
