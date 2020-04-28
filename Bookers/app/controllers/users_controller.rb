class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  @users = User.all
  @book = Book.new
  end
  # データを閲覧する画面を表示するためのAction
  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end
  # データを作成する画面を表示するためのAction
  def new
  @user = User.new
  end
  # データを更新する画面を表示するためのAction
  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end
  end
  # データを作成するためのAction
  def create
  @user = User.new(user_params)
  @user.save
  redirect_to @user
  end
  # データを更新するためのAction
  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
     render :edit, status: :unprocessable_entity
     
   end
 end
  # データを削除するためのAction
  def destroy
  end

 private
  def user_params
  params.require(:user).permit(:name, :profile_image ,:introduction )
  end


end