class UpdateSpecialOfferMailer < ApplicationMailer
  def notify
    @special_offer = params[:special_offer]
    @membership = params[:membership]

    mail(
      from: 'herf@gmail.com',
      to: @membership.email,
      subject: 'New Special Offer!'
    )
  end
end
