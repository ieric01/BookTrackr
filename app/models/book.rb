class Book < ActiveRecord::Base
	belongs_to :author
	accepts_nested_attributes_for :author
	has_attached_file :book_cover, :styles => { :medium => "600x400>"}, 
	:default_url => "http://www.ashlylorenzana.com/wp-content/uploads/2013/08/open_book_on_tabl_450.jpg"
  	validates_attachment_content_type :book_cover, :content_type => /\Aimage\/.*\Z/
end
