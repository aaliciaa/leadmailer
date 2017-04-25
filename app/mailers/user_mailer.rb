class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newlead.subject
  #
  def newlead(lead)
    @lead = lead
    @user = lead.user  # Instance variable => available in view
    mail(to: @user.email, subject: 'You have a New Lead')
    # This will render a view in `app/views/user_mailer`!
  end

  def forward(lead)
    @lead = lead
    @user = lead.user  # Instance variable => available in view
    mail(to: @user.email, subject: 'You have a New Lead')
    # This will render a view in `app/views/user_mailer`!
  end
end
