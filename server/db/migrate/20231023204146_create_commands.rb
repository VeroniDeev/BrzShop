class CreateCommands < ActiveRecord::Migration[7.1]
  def change
    create_table :commands do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.datetime :order_date
      t.boolean :is_delivred
      t.text :comment
      t.string :delivery_driver
      t.datetime :delivery_time

      t.timestamps
    end
  end
end
