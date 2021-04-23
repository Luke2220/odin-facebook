class PostsController < ApplicationController
    def index
        @user_posts = Array.new
        @user_list = User.where('id = ?',current_user.id).left_outer_joins(current_user.friends)
        @user_list.each do |user|
            @user_posts << user.posts
        end
        p @user_posts
        @timeline_posts = Post.joins(<<-SQL).
        INNER JOIN posts user_posts
        ON posts.id = user_posts.id
        SQL
        order(post_date: :desc)
 
      
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
