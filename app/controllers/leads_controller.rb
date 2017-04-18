class LeadsController < ApplicationController
  before_action :set_lead, only: [:edit, :update, :destroy, :mark_as_settled, :mark_as_lost]

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
    Lead.create(lead_params)
    redirect_to leads_path(@lead)
  end

  def destroy
    @lead = @user.lead
    @lead.destroy
    redirect_to lead_path(@lead)
  end

  def mark_as_settled
    @lead.status = "settled"
  end

  def mark_as_lost
    @lead.status = "lost"
  end

private

  def lead_params
    params.require(:lead).permit(:name, :email, :received_at, :accepted_at, :status, :source, :user_id)
  end

  def set_lead
    @lead = Lead.find(params[:id])
  end
end
