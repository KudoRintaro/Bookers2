class UsersController < ApplicationController
  def index
    @user=User.all
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
