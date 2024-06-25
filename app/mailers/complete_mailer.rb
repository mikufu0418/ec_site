class CompleteMailer < ApplicationMailer
  def complete_mail(complete, order)
    @order = Order.find(order.id)
    mail to: complete.email, subject: 'ご注文ありがとうございます。'
  end
end
