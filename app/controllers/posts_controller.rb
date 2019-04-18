class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache) #image_cacheは画像のデータそのものを取り扱うパラメータで、確認画面の実装を挟む時などに使用する
  end
end
