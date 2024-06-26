require "rails_helper"

RSpec.describe CompleteMailer, type: :mailer do
  describe "complete_mail" do
    let(:mail) { CompleteMailer.complete_mail }

    it "renders the headers" do
      expect(mail.subject).to eq("Complete mail")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
