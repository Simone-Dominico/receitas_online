class AddIngredientsToRevenues < ActiveRecord::Migration
  def change
    add_column :revenues, :ingredients, :string
  end
end
