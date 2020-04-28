class PostsController < ApplicationController
  include ApplicationHelper

  before_action :redirect_unless_admin, except: [:show, :index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    post.images.attach(params[:images])

    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.delete

    redirect_to root_path
  end

  private

  def redirect_unless_admin
    redirect_to root_path unless current_user && current_user_admin?
  end

  def post_params
    params.require(:post).permit(:title, :body, images: [])
  end
end