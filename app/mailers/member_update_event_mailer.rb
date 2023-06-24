class MemberUpdateEventMailer < ApplicationMailer
  def notify
    @membership = params[:membership]
    @event = params[:event]

    mail(
      from: 'herf@gmail.com',
      to: @membership.email,
      subject: 'New event details!'
    )
  end
end
