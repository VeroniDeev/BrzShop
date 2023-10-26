class DeleteCategoryNameToProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :category_name, :string
  end
end
