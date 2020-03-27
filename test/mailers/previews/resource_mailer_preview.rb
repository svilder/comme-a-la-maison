# Preview all emails at http://localhost:3000/rails/mailers/resource_mailer
class ResourceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/resource_mailer/thanks
  def thanks
    user = User.first
    # This is how you pass value to params[:user] inside mailer definition!
    ResourceMailer.with(user: user).thanks
  end

  # Preview this email at http://localhost:3000/rails/mailers/resource_mailer/approved
  def approved
    user = User.first
    ResourceMailer.with(user: user).approved
  end

end
