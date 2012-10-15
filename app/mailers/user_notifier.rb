class UserNotifier < ActionMailer::Base
  #default from: "from@example.com"
   
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.created.subject
  #
  def created(user)
    @user = user
    mail to: user.email, subject: 'Verteo BioPharma New Profile Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.updated.subject
  #
  def updated(user)
    @user = user
    mail to: user.email, subject: 'Verteo BioPharma Profile Update Confirmation'
  end
end
