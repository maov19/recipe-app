class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.decimal :price
      t.integer :quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps

      ##relationships will be added once all the tables are created
    end
  end
end
