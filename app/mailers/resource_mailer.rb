class ResourceMailer < ApplicationMailer
  def thanks
    @user = params[:user]
    mail(to: @user.email, subject: 'Merci pour votre participation')
  end

  def approved
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
