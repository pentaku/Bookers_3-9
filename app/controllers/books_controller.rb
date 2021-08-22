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
    redirect_to '/'
  end

  private

  def booklist_params
    params.require(:booklist).permit(:title, :body)
  end
end
