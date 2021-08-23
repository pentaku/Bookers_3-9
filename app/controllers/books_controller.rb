class BooksController < ApplicationController
  def top
  end

  def index
    @booklist = Book.new
    @booklists = Book.all
  end

  def create
    @booklist = Book.new(book_params)
    @booklists = Book.all
    if @booklist.save
       flash[:notice] = "Book was successfully created."
       redirect_to book_path(@booklist.id)
    else
       render  :index
    end

  end

  def show
     @booklist = Book.find(params[:id])
  end

  def edit
    @booklist = Book.find(params[:id])
  end

  def update
    @booklist = Book.find(params[:id])
    if @booklist.update(book_params)
       flash[:notice] = "Book was successfully created."
       redirect_to book_path(@booklist.id)
    else
      render :edit
    end
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
