# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/update_membership
class UpdateMembershipPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/update_membership/notify
  def notify
    UpdateMembershipMailer.with(membership: membership, lounge: lounge).notify
  end

  private

  def membership
    Membership.last
  end

  def lounge
    Lounge.last
  end
end
