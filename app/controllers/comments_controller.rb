class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@question = current_user.comments.last.question_id
		@comment = Comment.new(comment_params)
    if @comment.save
  		redirect_to :back
  		# else
  		# redirect_to posts_path
  	end
	end

  def index
  end

  def show
  end

  def edit
  end


  private

	def comment_params
		params.require(:comment).permit(:user_id, :question_id, :body)
	end

end
