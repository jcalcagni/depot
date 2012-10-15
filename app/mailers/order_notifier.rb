class OrderNotifier < ActionMailer::Base
  default from: "Verteo Pharma samples@verteo.com"
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Verteo BioPharma Samples Order Confirmation'
  end



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
 def shipped(order)
    @order = order
    mail to: order.email, subject: 'Verteo Biopharma Samples Shipped'
  end
end

