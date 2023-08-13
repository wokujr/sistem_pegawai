class CreateClocks < ActiveRecord::Migration[7.0]
  def change
    create_table :clocks do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.boolean :clock_in
      t.datetime :event_time

      t.timestamps

    end
  end
end
