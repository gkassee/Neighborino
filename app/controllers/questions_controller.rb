class QuestionsController < ApplicationController

	def new
		@question = Question.new
	end

	def create
    @user = User.all
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
    # @user = User.all
     @user = User.near("#{@question.latitude}, #{@question.longitude}", 5)
  end


  def edit
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    @question.save
    redirect_to root_path
  end


  private

	def question_params
		params.require(:question).permit(:user_id, :body, :address, :latitude, :longitude)
	end

end
