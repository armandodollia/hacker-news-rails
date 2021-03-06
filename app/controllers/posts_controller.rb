class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def create
    params[:post][:username] = Faker::Internet.user_name
    params[:post][:comment_count] = rand(1000)
    params[:post][:tags] = params[:post][:tags].split
    new_post = Post.new(post_params)
    
    # TODO Convert ajax route to rails
    if new_post.save
      :ok
      if request.xhr?
        render_partial '/posts/post', locals: {post: new_post}, layout: false
      else
        redirect_to '/posts'
      end
    else
      :unprocessable_entity
    end
  end
  
  def destroy
    Post.destroy(params[:id])
    redirect_to '/'
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :username, :content, :tags, :comment_count)
  end
  
end