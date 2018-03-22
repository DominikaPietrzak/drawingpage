class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    if current_user.superadmin?
      @post = Post.new
    else
      flash[:notice] = "Only superadmin can add post"
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
        flash[:notice] ="Only superadmin can add psot"
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(article_params)
      redirect_to @post
    else
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
    params.require(:post).permit(:title, :content, :image)
  end

end
