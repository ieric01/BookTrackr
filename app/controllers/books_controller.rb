class BooksController < ApplicationController

  def index
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(:title => params[:book][:title], 
  					:description => params[:book][:description])
  	# binding.pry

  	#TRY ONLY ASSOCIATING THE AUTHOR ID WITH BOOK AND REMOVE THE AUTHOR NAME COLUMN
  	#IN BOOKS TABLE,

  	# create author only if it doesnt exist, if it does exist just assign
  	#the book to author

  	if @book.save
  		flash[:notice] = "You've successfully created a new book to track!"
  		redirect_to @book
  	else
  		render "new"
  	end


  	#create a new book with author here for tomorrow
  end

  private 
	#strong params created to prevent sql injection and mass assignment
	#whitlisted desired attributes
  def book_params
		params.require(:book).permit(:title, :description, :author_attributes => [:author_name])
  end
end
