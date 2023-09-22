class CommentsController < ApplicationController
  before_action :set_property
  before_action :set_comment, only: [:update, :destroy]

  # GET /properties/:property_id/comments
  def index
    @comments = @property.comments
    render json: { comments: @comments, count: @comments.count }
  end

  # POST /properties/:property_id/comments
  def create
    @comment = @property.comments.new(comment_params)
    @comment.user_id = current_user.id # assuming you have a method that gets the current user


    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private 

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_comment
    @comment = @property.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
