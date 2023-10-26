class AddCategoryNameToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :category_name, :string
  end
end
