class AddToRevenuesPopularidade < ActiveRecord::Migration
  def change
  	add_column :revenues, :popularidade, :integer
  end
end
