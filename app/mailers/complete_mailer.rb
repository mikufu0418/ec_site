class CompleteMailer < ApplicationMailer
  def complete_mail(complete)
    @complete = complete
    mail to: complete.email, subject: 'ToDo登録のお知らせ'
  end
end
