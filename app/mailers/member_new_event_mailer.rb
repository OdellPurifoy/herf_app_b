class MemberNewEventMailer < ApplicationMailer
  def notify
    @membership = params[:membership]
    @event = params[:event]

    mail(
      from: 'herf@gmail.com',
      to: @membership.email,
      subject: 'You are invited!'
    )
  end
end
