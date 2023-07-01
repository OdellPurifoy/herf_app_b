require "rails_helper"

RSpec.describe NewMemberWelcomeMailer, type: :mailer do
  describe "send_welcome_email" do
    let(:mail) { NewMemberWelcomeMailer.send_welcome_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Send welcome email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
