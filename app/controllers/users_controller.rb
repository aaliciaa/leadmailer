class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_availability]

  def index
    @users = User.all
    @leads = Lead.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    # find, as above
  end

  def update
    User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    # find, as above
    @leads = @user.leads
  end


  def destroy
    @user.destroy
    redirect_to user_path(@user)
  end

  def toggle_availability
    # Click to update availability (Link_to in show)
    @user.toggle!(:available)

    redirect_to user_path(@user)
    # Remove or add from lead rotation
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :manager, :rank, :photo, :available)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
