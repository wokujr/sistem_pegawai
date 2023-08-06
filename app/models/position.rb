class Position < ApplicationRecord

  belongs_to :karyawan
  validates :karyawan_id, presence: true

end
