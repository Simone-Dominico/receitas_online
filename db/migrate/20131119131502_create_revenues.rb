class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.string :preparation
      t.integer :user_id

      t.timestamps
    end
    add_index :revenues, [:user_id, :created_at]
  end
end
