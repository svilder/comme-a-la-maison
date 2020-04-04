class ResourceMailer < ApplicationMailer
  def thanks
    @user = params[:user]
    # @email = AdminUser.find_by(send_emails: true).email

    mail(to: @user.email, subject: 'Merci pour votre participation')
  end

  def approved
    @user = params[:user]
    mail(to: @user.email, subject: 'Votre ressource a été publiée')
  end

end
