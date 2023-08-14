class EmployeeCategory < ApplicationRecord
  belongs_to :position
  belongs_to :karyawan
end