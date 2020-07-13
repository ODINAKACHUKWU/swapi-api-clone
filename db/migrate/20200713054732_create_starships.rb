class CreateStarships < ActiveRecord::Migration[5.2]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.string :hyperdrive_rating
      t.string :length
      t.string :max_atmosphering_speed
      t.string :cargo_capacity
      t.string :crew
      t.integer :pilots
      t.string :passengers

      t.timestamps
    end
  end
end
