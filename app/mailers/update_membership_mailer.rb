# frozen_string_literal: true

class UpdateMembershipMailer < ApplicationMailer
  def notify
    @membership = params[:membership]
    @lounge = params[:lounge]

    mail(
      from: 'herf@gmail.com',
      to: @membership.email,
      subject: 'Your membership has been updated'
    )
  end
end
