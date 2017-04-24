class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_availability]

  def index
    # @users = User.order(:name)
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
    @pending_leads = @user.leads.where(status: "pending")
    @ongoing_leads = @user.leads.where(status: "accepted")
    @completed_leads = @user.leads.where(status: ["settled", "lost"])
    @users = User.all
    @leads = Lead.all
  end


  def destroy
    @user.destroy
    redirect_to :back
  end

  def toggle_availability
    if @user.available
      remove_from_lineup(@user)
    else # false to true
      add_to_lineup(@user)
    end
    @user.toggle!(:available)
    redirect_to :back
  end


  # lineup methods

  def add_to_lineup(user)
    # user becomes available OR add new user
    bumped_lineup = Lineup.first.lineup
    bumped_lineup << user
    Lineup.destroy_all
    Lineup.create(:lineup => bumped_lineup)
  end

  def remove_from_lineup(user)
    # user becomes UN-available OR user is deleted
    bumped_index = Lineup.first.lineup.find_index(user)
    bumped_lineup = Lineup.first.lineup
    bumped_lineup.delete_at(bumped_index)
    Lineup.destroy_all
    Lineup.create(:lineup => bumped_lineup)
  end



private

  def user_params
    params.require(:user).permit(:name, :email, :password, :manager, :rank, :photo, :available)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
