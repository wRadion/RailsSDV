class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])

    @comment.post = @post
    @comment.user = @current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @current_user == @comment.user && @comment.destroy
        format.html { redirect_to posts_url, notice: "Comment was successfully destroyed." }
        format.json { head :no_content }
      else
        raise "Comment could not be destroyed."
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
