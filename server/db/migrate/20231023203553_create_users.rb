class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :phone
      t.string :mail
      t.string :country
      t.text :adresse
      t.integer :postal
      t.string :role

      t.timestamps
    end
  end
end
