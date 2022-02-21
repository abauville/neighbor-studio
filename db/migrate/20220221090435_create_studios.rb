class CreateStudios < ActiveRecord::Migration[6.1]
  def change
    create_table :studios do |t|
      t.string :name
      t.text :address
      t.text :descript
      t.references :user, null: false, foreign_key: true
      t.integer :price


      t.timestamps
    end
  end
end
