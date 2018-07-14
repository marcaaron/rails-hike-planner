class CommentsController < ApplicationController

  http_basic_authenticate_with name: "user", password: "password", only: :destroy

  def create
    @trail = Trail.find(params[:trail_id])
    @comment = @trail.comments.create(comment_params)
    redirect_to trail_path(@trail)
  end

  def destroy
    @trail = Trail.find(params[:trail_id])
    @comment = @trail.comments.find(params[:id])
    @comment.destroy
    redirect_to trail_path(@trail)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
