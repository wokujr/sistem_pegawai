class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.references :karyawan, null: false , foreign_keys: true
      t.references :position, nul: false,  foreign_keys: true
      t.float :amount

      t.timestamps
    end
  end
end
