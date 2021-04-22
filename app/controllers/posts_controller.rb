class PostsController < ApplicationController
    def index
        @timeline_posts = Array.new
        @posts = Post.all
        @posts.each do |post|
            if current_user.posts.contains(post)
                timeline_posts << post
            else
                current_user.friends.each do |fri|
                    if fri.posts.contains(post)
                        timeline_posts << post
                    end
                end
            end
        end
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        @post.post_date = DateTime.now

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
