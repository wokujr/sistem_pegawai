class CreateCLocks < ActiveRecord::Migration[7.0]
  def change
    create_table :c_locks do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :clock_in
      t.datetime :event_time

      t.timestamps
    end
  end
end
