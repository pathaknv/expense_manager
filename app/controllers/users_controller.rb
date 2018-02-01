class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to  @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @transaction = Transaction.find_by(user_id: params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => { :user => @user, :transaction => @transaction  } }
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
