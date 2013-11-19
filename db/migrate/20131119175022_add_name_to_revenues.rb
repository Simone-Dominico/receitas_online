class AddNameToRevenues < ActiveRecord::Migration
  def change
    add_column :revenues, :name, :string
  end
end
