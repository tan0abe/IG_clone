class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :likes]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "登録しました"
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    if current_user.present? #ログインしていない時は、current_user.idを確かめないので、current_userがnilというエラーにならない
      unless current_user.id == @user.id
        flash[:danger] = "他人のプロフィールは見ることができません！"
        redirect_to posts_path
      end
    end
  end

  def edit
    if current_user.present? #ログインしていない時は、current_user.idを確かめないので、current_userがnilというエラーにならない
      unless current_user.id == @user.id
        flash[:danger] = "他人のプロフィールは編集できません！"
        redirect_to posts_path
      end
    end
  end

  def update
    if current_user.id == @user.id
      if @user.update(user_params)
        flash[:notice] = "更新しました"
        redirect_to posts_path
      else
        flash.now[:danger] = "更新できませんでした"
        render 'edit'
      end
    else
      flash[:danger] = "他人のプロフィールは編集できません！"
      redirect_to new_session_path
    end
  end

  def likes
    @favorites = @user.favorites
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
