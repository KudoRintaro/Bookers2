class UsersController < ApplicationController
  def index
    @users=User.all
    @book=Book.new
  end 
  
  def create
    book=Book.new(book_params)
    book.user_id=current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def show
    user_id=current_user.id
    @user=User.find(user_id)
  end

  def edit
    user_id=current_user.id
    @user=User.find(user_id)
  end
end
