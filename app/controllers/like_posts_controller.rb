class LikePostsController < ApplicationController

    def create 
        @post = Post.find(params[:post_id])
        @like_post = @post.like_posts.new(user_id: current_user.id)

        if  @like_post.save
            respond_to do |format|
                format.html {redirect_to root_path}
                format.js { }
            end
        else 
            render :new , status: :unprocessable_entity
        end
    end

    def destroy 
        @post = Post.find(params[:post_id])
        @like_post =  @post.like_posts.find(params[:id])
        @like_post.destroy
        respond_to do |format|
            format.html {redirect_to root_path}
            format.js { }
        end
    end  
end  