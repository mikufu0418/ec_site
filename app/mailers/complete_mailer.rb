class CompleteMailer < ApplicationMailer
  def complete_mail(complete, book)
    @book = Book.find(book.id)
    mail to: complete.email, subject: 'ご注文ありがとうございます。'
  end
end
