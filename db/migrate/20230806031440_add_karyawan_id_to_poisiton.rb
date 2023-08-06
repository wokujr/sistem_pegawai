class AddKaryawanIdtoPoisiton < ActiveRecord::Migration[7.0]
  def change
    add_reference :positions, :karyawan, foreign_key: true, value: uuid, null: false
  end
end
