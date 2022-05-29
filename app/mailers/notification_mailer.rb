class NotificationMailer < ApplicationMailer
  def notification_mailer
    @user = params[:user]
    mail(to: @user.email, subject: "Due date notify")
  end
end
