class PostsController < ApplicationController
    def index

    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
      
        if @post.save!
            redirect_to user_path(current_user.id), notice: 'Post successfully created'
        else
            render new_post_path, alert: 'Post could not create'
        end
    end

    private

def post_params
    params.require(:post).permit(:title,:body)
end

end
