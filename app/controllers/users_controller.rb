class UsersController < ApplicationController

def show
  @posts = current_user.posts.list_comments_posts
  @videos = current_user.posts.list_comments_videos
end

def edit
end

def updade
  if current_user.update(user_params)
    redirect_to user_path(current_user.id), notice: 'User updated successfull'
  else
    flash.now[:alert] = current_user.errors.full_messages.to_sentence
  end
end

private

def user_params
  params.require(:user).permit(:name, :avatar)
end

end
