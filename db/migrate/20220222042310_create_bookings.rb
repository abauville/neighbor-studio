class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.smalldatetime :date_start
      t.smalldatetime :date_end
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :studio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
