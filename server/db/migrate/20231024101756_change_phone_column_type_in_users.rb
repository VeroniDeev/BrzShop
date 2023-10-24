class ChangePhoneColumnTypeInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :phone, :string
  end
end
