class CreateWhoVoteds < ActiveRecord::Migration[7.1]
  def change
    create_table :who_voteds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.boolean :is_like

      t.timestamps
    end
  end
end
