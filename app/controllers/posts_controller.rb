class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    post_all
  end

  def new
    if current_user.superadmin?
      @post = Post.new
    else
      post_all #must be defind!
      render 'index'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    if current_user.superadmin?
      @post = Post.new(posts_params)
      if @post.save
        redirect_to @post
      else
        post_all
        render 'index'
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to @post
    else
      post_all
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text, :image)
  end

  def post_all
    @posts = Post.all
  end
end
