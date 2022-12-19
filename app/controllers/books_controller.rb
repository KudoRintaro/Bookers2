class BooksController < ApplicationController
  def new
    @books=Book.all
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.save
  end 
  
  def index
    user_id=current_user.id
    @user=User.find(user_id)
  end

  def show
  end

  def edit
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
