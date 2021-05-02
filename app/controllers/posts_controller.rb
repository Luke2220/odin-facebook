class PostsController < ApplicationController
    def index
        @user_posts = Array.new
        @user_list = Array.new

        current_user.friends.each do |friend|
            @user_list << User.find(friend.user_id)
        end
        @user_list << current_user

        @user_list.each do |user|
            @user_posts << user.posts
        end
        @timeline_posts = Post.order(post_date: :desc).merge(@user_posts.flatten)
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
