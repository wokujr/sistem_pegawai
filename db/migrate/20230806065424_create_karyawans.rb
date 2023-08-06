class CreateKaryawans < ActiveRecord::Migration[7.0]
  def change
    create_table :karyawans do |t|
      t.string :name
      t.integer :age
      t.string :address
      t.references :position, foreign_keys: true , null: false

      t.timestamps
    end
  end
end
