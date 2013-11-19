class AddCategoryIdToRevenues < ActiveRecord::Migration
  def change
    add_column :revenues, :category_id, :integer
  end
end
