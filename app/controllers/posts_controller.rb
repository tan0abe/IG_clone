class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
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

  def edit

  end

  def confirm
    @post = Post.new(post_params)
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "更新しました"
      redirect_to posts_path
    else
      flash[:danger] = "更新できませんでした"
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, info:"投稿を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image_path, :image_path_cache) #image_cacheは画像のデータそのものを取り扱うパラメータで、確認画面の実装を挟む時などに使用する
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
