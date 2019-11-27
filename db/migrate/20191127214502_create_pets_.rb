class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :color
      t.string :food_name
      t.string :feeding_instructions
      t.string :medications
    end
  end
end
