# frozen_string_literal: true

class NewMemberWelcomeMailer < ApplicationMailer
  def send_welcome_email
    @membership = params[:membership]
    @lounge = params[:lounge]

    mail(
      from: 'herf@gmail.com',
      to: @membership.email,
      subject: 'Welcome to Herf!'
    )
  end
end
