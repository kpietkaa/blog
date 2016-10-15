class CommentsController < ApplicationController
  before_action :find_post
  before_action :set_locale

  def create
    @comment = @post.comments.create(secure_params)
    if @comment.errors.any?
      render "posts/show"
    else
      redirect_to @post
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def find_post
    @post ||= Post.find(params[:post_id])
  end

  def secure_params
    params.require(:comment).permit(:name, :body)
  end

  def set_locale
    I18n.locale = :pl
  end
end
