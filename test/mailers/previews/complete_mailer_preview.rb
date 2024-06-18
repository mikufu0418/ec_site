class CompleteMailerPreview < ActionMailer::Preview

    def complete_mail
      user = User.new(email: "sample@example.com", password: "fgggggg")
      CompleteMailer.complete_mail(user)
     
    end
  end