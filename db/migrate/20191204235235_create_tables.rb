class CreateTables < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :color
      t.string :food_name
      t.string :feeding_instructions
      t.string :medications
      t.integer :user_id
    end

    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
    end

    create_table :accounts do |t|
      t.string :username
      t.string :password_digest
      t.integer :user_id
    end
  end
end
