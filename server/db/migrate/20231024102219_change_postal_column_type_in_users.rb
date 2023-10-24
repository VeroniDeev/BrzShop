class ChangePostalColumnTypeInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :postal, :string
  end
end
