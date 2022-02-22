class AddCoordinatesToStudio < ActiveRecord::Migration[6.1]
  def change
    add_column :studios, :lat, :float
    add_column :studios, :lon, :float
  end
end
