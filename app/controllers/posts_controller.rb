class PostsController < ApplicationController

  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order(created_at: :desc)
    else
      @posts = Post.all
    end
  end

  def list_posts
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order(created_at: :desc)
    else
      @posts = Post.listposts
    end
  end

  def list_videos
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order(created_at: :desc)
    else
      @posts = Post.listvideos
    end
  end

  def list_video
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_param.merge(user: current_user))
    if current_user.kind == 'admin' || current_user.kind == 'manager'
      if @post.save
        redirect_to @post, notice: 'Post created successfully!!!'
      else
        flash.now[:alert] = @post.errors.full_messages.to_sentence
        render :new
      end
    else
      render :index
    end
  end

  def updade
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully!!!'
    else
      flash.now[:alert] = @post.errors.full_messages.to_setence
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_param
    params.require(:post).permit(:title, :body, :thumbnail, :upload, :type_subject, :tag_list)
  end

end
