class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user&.save
      log_in(@user)
      flash[:success] = 'Sign up successfull'
      redirect_to @user
    else
      render 'users/create'
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
        flash[:success] = "Profile updated"
        #redirect_to
    end
  end

  private
  
  def user_params
  
    params.permit(:email, :password)
    
  end

end




