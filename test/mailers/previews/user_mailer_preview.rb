
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.newlead(User.first)
  end
end
