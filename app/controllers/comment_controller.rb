class CommentController < ApplicationController

    def new
        @comment = Comment.create
        comment_id = @comment.id
        redirect_to user_path(current_user.id, comment_id)
    end

end
