class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :logged_in_user, except: [:index, :show]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      ContactMailer.contact_mail(@post).deliver
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      flash[:danger] = "投稿できませんでした"
      render "new"
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def edit
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render 'new' if @post.invalid?
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "更新しました"
      redirect_to posts_path
    else
      flash.now[:danger] = "更新できませんでした"
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, info:"投稿を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image_path, :image_path_cache, :user_id) #image_cacheは画像のデータそのものを取り扱うパラメータで、確認画面の実装を挟む時などに使用する
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください！"
      redirect_to new_session_path
    end
  end

   def correct_user
    if current_user.present? #ログインしていない時は、current_user.idを確かめないので、current_userがnilというエラーにならない
      unless current_user.id == @post.user_id
        flash[:danger] = "他の人の投稿は編集できません！"
        redirect_to posts_path
      end
    end
  end
end
