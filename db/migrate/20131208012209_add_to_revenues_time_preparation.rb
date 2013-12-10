class AddToRevenuesTimePreparation < ActiveRecord::Migration
  def change
  	add_column :revenues, :timePreparation, :string
  end
end
