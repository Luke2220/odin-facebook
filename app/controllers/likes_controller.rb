class LikesController < ApplicationController
    def new
        @like = Like.new
        @user = User.find(params[:user_id])
        @user.likes << @like

        @post = Post.find(params[:post_id])
        @post.likes << @like
        @like.save!
        redirect_to user_path(@user.id), notice: 'Post has been liked!'
    end

    def destroy
        @like = Like.find(params[:id]) 
        @like.destroy 
        redirect_to user_path(current_user.id), notice: 'Post has been unliked.'
    end

    private
    
    def like_params
        params.require(:like).permit(:user_id,:post_id)
    end


end
