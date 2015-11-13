class UsersController < ApplicationController

  def new
  end

  # def current_user
  #   @current_user =  User.find_by(session[user_id])
  # end

  def update_score
    score = params[:score]
    score_int = Integer(score)
    current_user.score += score_int
    current_user.save
    render :nothing => true
  end

  def create
    user = User.new(user_params)
    user.score = 0
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
    def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
