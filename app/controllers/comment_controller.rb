class CommentController < ApplicationController

    def new
        comment_form = true
        redirect_to user_path(current_user.id, comment_form)
    end

    def create
        @comment = Comment.new
        @comment.content = params[:content]
        if @comment.save!
            redirect_to user_path(current_user, @comment.id), notice: 'Comment posted'
        else 
            render user_path(current_user), alert: 'Comment could not be posted'
        end

    end

    private

  

end
