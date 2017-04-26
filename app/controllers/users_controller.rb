# require '../services/update_lineup.rb'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_availability]

  def index
    # @users = User.order(:name)
    if params[:order]
      @users = User.order(params[:order].to_sym)
    else
      @users = User.order(rank: :asc)
    end
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


private

  def add_to_lineup(user)
    AdjustLineupService.new(user).add
  end

  def remove_from_lineup(user)
    AdjustLineupService.new(user).remove
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :manager, :rank, :photo, :available)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
