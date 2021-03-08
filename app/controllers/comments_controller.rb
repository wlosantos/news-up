class CommentsController < ApplicationController

before_action :set_comment, only: %i[ upvote downvote update ]

def create
  @comment = current_user.comments.new(comment_params)
  if @comment.save
    redirect_to @comment.post, notice: 'Comment created with successfully!!!'
  else
    flash.now[:alert] = @comment.errors.full_messages.to_sentence
    redirect_to @comment.post
  end
end

def upvote
  @comment.upvote_from current_user
  redirect_to @comment.post
end

def downvote
  @comment.downvote_from current_user
  redirect_to @comment.post
end

def update
  if @comment.update(comment_params)
    render json: { successull: true}, notice: 'Comments update successfully!!!'
  else
    render json: { successull: false}
    flash.now[:alert] = 'ERROR'
  end
end

def destroy
end

private

def set_comment
  @comment = Comment.find(params[:id])
end

def comment_params
  params.require(:comment).permit(:commenter, :post_id, :status)
end

end
