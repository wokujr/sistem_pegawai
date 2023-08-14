class EmployeeCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_categories do |t|
      t.integer :karyawan_id
      t.integer :position_id
    end
  end
end
