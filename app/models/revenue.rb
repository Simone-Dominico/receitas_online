class Revenue < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true
	validates :preparation, presence: true, length: { maximum: 10000000 }
	validates :ingredients, presence: true, length: { maximum: 10000 }
	validates :user_id, presence: true
	validates :category_id, presence: true
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "120x90#" }, :default_url=> "/images/:styles/missing.png" 
end
