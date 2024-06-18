class CompleteMailer < ApplicationMailer
  def complete_mail(complete)
    @complete = complete
    mail to: complete.email, subject: 'ご注文ありがとうございます。'
  end
end
