class UsersController < ApplicationController
  def index
    @users=User.all
    @book=Book.new
    @user=current_user
  end

  def create
    @book=Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
    else
     render :index
   end
  end

  def show
    @user=User.find(params[:id])
    @books=Book.all
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
    user_id=params[:id].to_i
    login_user_id=current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(login_user_id)
    end 
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
