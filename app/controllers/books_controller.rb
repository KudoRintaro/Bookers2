class BooksController < ApplicationController

  def index
    user_id=current_user.id
    @user=User.find(user_id)
    @book=Book.new
    @books=Book.all
  end

  def create
    book=Book.new(book_params)
    book.user_id=current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @bookfind=Book.find(params[:id])
    @book=Book.new
    user_id=@bookfind.user_id
    @user=User.find(user_id)
  end 

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    book=Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end 
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end 

 private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
