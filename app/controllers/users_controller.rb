class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @today_books = @books.created_today
    @yesterday_books = @books.created_yesterday
    @books_2days_ago = @books.created_2days_ago
    @books_3days_ago = @books.created_3days_ago
    @books_4days_ago = @books.created_4days_ago
    @books_5days_ago = @books.created_5days_ago
    @books_6days_ago = @books.created_6days_ago
    @this_week_books = @books.created_this_week
    @last_week_books = @books.created_last_week
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
