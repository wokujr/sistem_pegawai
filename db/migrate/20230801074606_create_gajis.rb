class CreateGajis < ActiveRecord::Migration[7.0]
  def change
    create_table :gajis do |t|
      t.string :gaji
      t.string :kode_gaji

      t.timestamps
    end
  end
end
