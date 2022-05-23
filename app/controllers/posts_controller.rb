class PostsController < ApplicationController
def index
  @user = User.find(params[:user_id])
  @post = current_user.posts
end

def show 
  @user = User.find(params[:user_id])
  @post = Post.find(params[:id])
end 

def new 
  @user = User.find(params[:user_id])
  @post = @user.posts.new
end 

def create 
  @user = User.find(params[:user_id])
  @post = @user.posts.new(post_params)

  if @post.save
    if params[:post][:image].present?
      params[:post][:image].each do |img|
        @post.post_images.create(image: img)
      end  
    end

    if params[:post][:video].present?
      params[:post][:video].each do |vdo|
        @post.post_videos.create(video: vdo)
      end 
    end 

    redirect_to user_posts_path
  else 
    render :new, status: :unprocessable_entity
  end 
end 

def edit 
  @user = User.find(params[:user_id])
  @post = Post.find(params[:id])
end 

def update 
  @user = User.find(params[:user_id])
  @post = Post.find(params[:id])

  if @post.update(post_params)

    if  params[:post][:image].present? 
      @post.post_images.destroy_all
      params[:post][:image].each do |img|
        @post.post_images.create(image:img)
      end
    end 
  redirect_to user_posts_path
  
  else 
    render :edit, status: :unprocessable_entity
  end 
end 

def destroy 
  @user = User.find(params[:user_id])
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to user_posts_path
end 


private
  def post_params
    params.require(:post).permit(:title, :content)
  end 
end 


