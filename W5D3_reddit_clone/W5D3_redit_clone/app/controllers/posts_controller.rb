

class PostsController < ApplicationController
  before_action :ensure_logged_in

  def new
    @post = Post.new
  end

  def create
    params[:post][:subreddit_ids].map! { |el| el.to_i }
    params[:post][:subreddit_ids] = params[:post][:subreddit_ids].drop(1)
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save

      redirect_to post_url(@post)
    else

      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to subs_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, subreddit_ids: [])
  end

end
