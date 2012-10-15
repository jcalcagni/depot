class InquiryNotifier < ActionMailer::Base
  default from: "inquiries@verteo.com"
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_notifier.received.subject
  #
  def received(inquiry)
    @inquiry = inquiry
    mail to: inquiry.email, subject: 'Verteo BioPharma Inquiry Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_notifier.shipped.subject
  #
  def reviewed(inquiry)
    @inquiry = inquiry
    mail to: inquiry.email, subject: 'Verteo Biopharma Inquiry Reviewed'
  end
end
