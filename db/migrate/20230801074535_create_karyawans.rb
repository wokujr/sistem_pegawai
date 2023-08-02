class CreateKaryawans < ActiveRecord::Migration[7.0]
  def change
    create_table :karyawans, id: :uuid do |t|
      t.string :nama
      t.string :alamat
      t.integer :usia

      t.timestamps
    end
  end
end
