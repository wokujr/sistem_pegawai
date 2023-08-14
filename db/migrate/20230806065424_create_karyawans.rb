class CreateKaryawans < ActiveRecord::Migration[7.0]
  def change
    create_table :karyawans, id: :uuid do |t|
      t.string :name
      t.integer :age
      t.string :address
      t.references :user, foreign_keys: true, null:false, type: :uuid

      t.timestamps
    end
  end
end
