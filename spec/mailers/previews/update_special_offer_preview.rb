# Preview all emails at http://localhost:3000/rails/mailers/update_special_offer
class UpdateSpecialOfferPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/update_special_offer/notify
  def notify
    UpdateSpecialOfferMailer.with(special_offer: special_offer, membership: membership).notify
  end

  private

  def special_offer
    SpecialOffer.last
  end

  def membership
    Membership.last
  end
end
