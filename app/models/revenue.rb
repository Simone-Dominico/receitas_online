class Revenue < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	default_scope -> { order('created_at DESC') }
	validates :preparation, presence: true, length: { maximum: 500 }
	validates :ingredients, presence: true
	validates :user_id, presence: true
	validates :category_id, presence: true
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "120x90#" },
					  :default_url=> "/images/:styles/missing.png" 
end
