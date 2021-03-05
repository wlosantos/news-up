class CommentsController < ApplicationController

def create
  @comment = current_user.comments.new(comment_params)
  if @comment.save
    redirect_to @comment.post, notice: 'Comment created with successfully!!!'
  else
    flash[:alert] = @comment.errors.full_messages.to_sentence
    redirect_to @comment.post
  end
end

def destroy
end

private

def comment_params
  params.require(:comment).permit(:commenter, :post_id)
end

end
