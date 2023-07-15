# Preview all emails at http://localhost:3000/rails/mailers/new_special_offer
class NewSpecialOfferPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/new_special_offer/notify
  def notify
    NewSpecialOfferMailer.with(special_offer: special_offer, membership: membership).notify
  end

  private

  def special_offer
    SpecialOffer.last
  end

  def membership
    Membership.last
  end
end
