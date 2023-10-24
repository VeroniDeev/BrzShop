class CreateCoupons < ActiveRecord::Migration[7.1]
  def change
    create_table :coupons do |t|
      t.text :code
      t.references :category, null: false, foreign_key: true
      t.integer :reduct

      t.timestamps
    end
  end
end
