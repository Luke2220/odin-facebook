class CommentController < ApplicationController

    def new
        comment_form = true
        redirect_to user_path(current_user.id, comment_form)
    end

    def create
        @post = params[:object_name].constantize.find(params[:object_id])
        @user = User.find(params[:user_id])
        
        @comment = @post.comments.build(content: params[:content])
        @comment.author_name = @user.username
        if @comment.save!
            redirect_to user_path(current_user), notice: 'Comment posted'
        else 
            render user_path(current_user), alert: 'Comment could not be posted'
        end

    end

    private

  

end
