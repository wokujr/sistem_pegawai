class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.references :karyawan, type: :uuid, null: false , foreign_keys: true
      t.references :position, null: false,  foreign_keys: true

      t.timestamps
    end
  end
end
