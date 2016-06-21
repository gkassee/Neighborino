class QuestionsController < ApplicationController

	def new
		@question = Question.new
	end

	def create
  	@question = Question.new(question_params)
    if @question.save
  		redirect_to user_path(current_user)
  	# else
  	# 	redirect_to posts_path
  	end
  end

  def index
  end

  def show
  	@question = Question.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end


  private

	def question_params
		params.require(:question).permit(:user_id, :body, :address, :latitude, :longitude)
	end

end
