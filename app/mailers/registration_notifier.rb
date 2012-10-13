class RegistrationNotifier < ActionMailer::Base
  default from: "Verteo Pharma registration@verteo.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(registration)
    @registration = registration
    mail to: registration.email, subject: 'Verteo BioPharma Registration Confirmation'
  end



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
 def shipped(registration)
    @registration = registration
    mail to: registration.email, subject: 'Verteo Biopharma Registration Packet Shipped'
  end
end
