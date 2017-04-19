class LeadsController < ApplicationController
  before_action :set_lead, only: [:edit, :update, :destroy, :mark_as_settled, :mark_as_lost, :mark_as_accepted]

  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.received_at = DateTime.now()
    @lead.status = "pending"
    @lead.source = @lead.source.strip
    if @lead.save
      redirect_to leads_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @lead.update(lead_params)
    if @lead.save
      redirect_to leads_path
    else
      render :new
    end
  end

  def destroy
    @lead.destroy
    redirect_to leads_path
  end

  def mark_as_accepted
    @lead.accepted_at = DateTime.now
    @lead.response_time = @lead.accepted_at - @lead.created_at
    @lead.status = "accepted"
    @lead.save
    redirect_to leads_path
  end

  def mark_as_settled
    @lead.status = "settled"
    @lead.save
    redirect_to leads_path
  end

  def mark_as_lost
    @lead.status = "lost"
    @lead.save
    redirect_to leads_path
  end

private

  def lead_params
    params.require(:lead).permit(:name, :email, :received_at, :accepted_at, :status, :source, :user_id)
  end

  def set_lead
    @lead = Lead.find(params[:id])
  end
end
