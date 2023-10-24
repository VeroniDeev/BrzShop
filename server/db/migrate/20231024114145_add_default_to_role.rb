class AddDefaultToRole < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :role, 'member'
  end
end
