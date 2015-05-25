class BooksController < ApplicationController

  def index
  end

  def new
  	@book = Book.new
    @book.build_author
  end

  def create
    #Here we can say if book already exits dont create it andnotify the user instead
  	@book = Book.new(book_params)

    # Message not showing up on show page
  	if @book.save
  		redirect_to @book, notice: "Successfully created new book"
  	else
  		render "new"
  	end

  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path, notice: "Successfully deleted book" 
  end

  private

  def book_params
		params.require(:book).permit(:title, :description, :book_cover, :author_attributes => [:name])
  end
end
