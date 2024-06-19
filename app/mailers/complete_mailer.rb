class CompleteMailer < ApplicationMailer
  def complete_mail(complete, book, order)
    @book = Book.find(book.id)
    @order = Order.find(order.id)
    mail to: complete.email, subject: 'ご注文ありがとうございます。'
  end
end
