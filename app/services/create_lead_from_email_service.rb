# user becomes available OR add new user

class CreateLeadFromEmailService
  def initialize(attributes)
    @attributes = attributes
  end

  def create
    puts "you made it to the create"
    @lead = Lead.new(
      name: @attributes[:name],
      email: @attributes[:email],
      phone: @attributes[:phone],
      source: @attributes[:source],
      html: @attributes[:html]
      )
    @lead.received_at = DateTime.now()
    @lead.status = "pending"

    @lead.user_id = AssignUserToLeadService.new(@lead.email).assign_user.id
    # @lead.user = RetrieveUserForNewLeadService.new(@lead).call

    @lead.save
    UserMailer.newlead(@lead).deliver_now
  end
end

