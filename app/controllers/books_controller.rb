class BooksController < ApplicationController
  def top
  end

  def new
    @booklist = Booklist.new
  end

  def index
    @booklists = Booklist.all
  end

  def create
    booklist = Booklist.new(booklist_params)
    booklist.save
    redirect_to book_path(booklist.id)
  end

  def show
     @booklist = Booklist.find(params[:id])
  end

  def edit
    @booklist = Booklist.find(params[:id])
  end

  def update
    booklist = Booklist.find(params[:id])
    booklist.update(booklist_params)
    redirect_to book_path(booklist.id)
  end


  private

  def booklist_params
    params.require(:booklist).permit(:title, :body)
  end
end
