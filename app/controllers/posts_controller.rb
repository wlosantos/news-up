class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge[user_id: current_user])
    if @post.save
      redirect_to @post, notice: 'Post created successfully!!!'
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new
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
    params.require(:post).permit(:title, :body)
  end

end
