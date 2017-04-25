# assign user to lead

class AssignUserToLeadService
# class RetrieveUserForNewLeadService
  def initialize(email)
    @email = email
  end

  # def initialize(lead)
  #   @lead = lead
  # end

  def assign_user
    last_lead_with_email = Lead.where(email: @email).last

    if last_lead_with_email
      return last_lead_with_email.user
    else
      lineup = Lineup.first
      assigned_user = lineup.lineup[0]
      lineup.bump
      return assigned_user
    end
  end

  # def call
  #   last_lead_with_email = Lead.where(email: @email)
  #   if @lead.email == last_lead_with_email.email
  #     return last_lead_with_email.user
  #   else
  #     lineup = Lineup.first
  #     to_be_assigned_user = lineup.lineup[0]
  #     lineup.bump
  #     return to_be_assigned_user
  #   end
  # end
end
