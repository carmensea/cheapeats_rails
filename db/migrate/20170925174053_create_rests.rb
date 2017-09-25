class CreateRests < ActiveRecord::Migration[5.1]
  def change
    create_table :rests do |t|
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
