require 'rails_helper'

RSpec.describe MemberUpdateEventMailer, type: :mailer do
  describe 'notify' do
    let(:mail) { MemberUpdateEventMailer.notify }
    let(:membership) { FactoryBot.create(:membership) }

    it 'renders the headers' do
      expect(mail.subject).to eq('New event details!')
      expect(mail.to).to eq([membership.email])
      expect(mail.from).to eq(['herf@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
