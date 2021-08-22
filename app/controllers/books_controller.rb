class BooksController < ApplicationController
  def top
  end

  def index
    @booklist = Book.new
    @booklists = Book.all
  end

  def create
    booklist = Book.new(book_params)
    booklist.save
    redirect_to book_path(booklist.id)
  end

  def show
     @booklist = Book.find(params[:id])
  end

  def edit
    @booklist = Book.find(params[:id])
  end

  def update
    booklist = Book.find(params[:id])
    booklist.update(book_params)
    redirect_to book_path(booklist.id)
  end

  def destroy
    booklist = Book.find(params[:id])
    booklist.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
