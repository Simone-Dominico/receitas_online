class AddImageIdToRevenues < ActiveRecord::Migration
  def up
  	add_attachment :revenues, :image
  end
  def down
  	remove_attachment :revenues, :image
  end
end
