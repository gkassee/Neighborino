class QuestionsController < ApplicationController

	def new
		@question = Question.new
	end

	def create
    @user = User.all
  	@question = Question.new(question_params)


    if @question.save

    #     @user.each do |user|

    #         def distance_between(lat1, lon1, lat2, lon2, options = {})

    #           # set default options
    #           options[:units] ||= :mi

    #           # convert degrees to radians
    #           lat1, lon1, lat2, lon2 = to_radians(lat1, lon1, lat2, lon2)

    #           # compute deltas
    #           dlat = lat2 - lat1
    #           dlon = lon2 - lon1

    #           a = (Math.sin(dlat / 2))**2 + Math.cos(lat1) *
    #               (Math.sin(dlon / 2))**2 * Math.cos(lat2)
    #           c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))
    #           c * earth_radius(options[:units])
    #         end

    #       @lat1 = @question.latitude
    #       @lon1 = @question.longitude
    #       @lat2 = user.latitude
    #       @lon2 = user.longitude

    #       puts @lat1
    #       puts @lon1
    #       puts @lat2
    #       puts @lon2

    #     end




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
     @user = User.near("#{@question.latitude}", "#{@question.longitude}", 5)
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
