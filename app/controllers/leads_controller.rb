class LeadsController < ApplicationController
  before_action :set_lead, only: [:edit, :update, :destroy, :mark_as_settled, :mark_as_lost, :mark_as_accepted]

  def index
    @leads = Lead.order(received_at: :desc)
    @users = User.all
  end

  def new
    @lead = Lead.new
  end

  def create
    @users = User.all
    @lead = Lead.new(lead_params)
    @lead.received_at = DateTime.now()
    @lead.status = "pending"
    @lead.source = @lead.source.strip
    if @lead.save
      UserMailer.newlead(@lead.user).deliver_now
      store_user_rankings(@users)
      redirect_to leads_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    @users = User.all
    @lead.update(lead_params)
    if @lead.save
      store_user_rankings(@users)
      redirect_to leads_path
      # redirect_to :back
    else
      render :new
    end
  end

  def destroy
    @users = User.all
    @lead.destroy
    store_user_rankings(@users)
    redirect_to leads_path
  end




  # beyond CRUD - User Actions:

  def mark_as_accepted
    @lead.accepted_at = DateTime.now
    @lead.response_time = @lead.accepted_at - @lead.created_at
    @lead.status = "accepted"
    @lead.save
    @users = User.all
    store_user_rankings(@users)
    redirect_to :back
  end

  def mark_as_settled
    @lead.status = "settled"
    @lead.save
    @users = User.all
    store_user_rankings(@users)
    redirect_to :back
  end

  def mark_as_lost
    @lead.status = "lost"
    @lead.save
    @users = User.all
    store_user_rankings(@users)
    redirect_to :back
  end





  # User Lineup

  def get_lineup(users)
    if Lineup.count < 1 || Lineup.first.lineup == nil
      lineup = []
      lineup = users.select do |user|
        user.available
      end
      Lineup.create(:lineup => lineup)
    end
    Lineup.first.lineup
  end

  # Edit Lineup

  def bump_lineup
    # from user from 1st pos to last
    # not sure if this rotate works they way I think it does -revisit
    bumped_lineup = Lineup.first.lineup.rotate(1)
    Lineup.destroy_all
    Lineup.create(:lineup => bumped_lineup)
  end




  # Simulate Incoming Email:

  def create_from_email
    @lead = Lead.new
  end

  def create_new_from_email
    @lead = Lead.new(lead_params)
    @lead.received_at = DateTime.now()
    @lead.status = "pending"
    get_lineup(User.all)
    @lead.user_id = assign_user(@lead.email).id
    @lead.save
    redirect_to leads_path
  end

  def assign_user(input_email)
    if Lead.where(email: input_email).last
      Lead.where(email: input_email).last.user
    else
      assignment = Lineup.first.lineup[0]
      bump_lineup
      assignment
    end
  end






  # Stat Calculations:

  def store_user_rankings(users)
    # users -> User.all -> this is all you need to access this method
    # calculate rankings, result -> [{name: biz, conversion: 23, ranking: 1}, ...]
    rankings = calculate_ranking(users)
    # store ranking to user instance
    users.each do |user|
      user.rank = rankings.find_index { |salesperson| salesperson[:name] == user.name } + 1
      user.save
    end
  end

  def calculate_ranking(users)
    ranking = []
    users.each do |user|
      ranking << {name: user.name, conversion: conversion_rate_for(user), rank: nil}
    end
    ranking.sort_by { |hsh| hsh[:conversion] }.reverse
    # result -> [{name: biz, conversion: 23, ranking: nil}, {}, {}]
    # ranking.map.with_index { |hsh, i| { name: hsh[:name], conversion: hsh[:conversion], rank: (i + 1) } }
  end

  def conversion_rate_for(user)
    lead_conversion_count = user.leads.where(status: "settled").count.to_f
    total_leads_count = user.leads.where(status: ["settled", "lost"]).count.to_f
    if total_leads_count != 0.0
      return (lead_conversion_count / total_leads_count * 100).round(2)
    else
      return 0.0
    end
  end

private

  def lead_params
    params.require(:lead).permit(:name, :email, :received_at, :accepted_at, :status, :source, :user_id)
  end

  def set_lead
    @lead = Lead.find(params[:id])
  end
end





