class Book < ActiveRecord::Base
	belongs_to :author
	accepts_nested_attributes_for :author
	has_attached_file :book_cover, :styles => { :medium => "600x400>"}, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :book_cover, :content_type => /\Aimage\/.*\Z/
end
