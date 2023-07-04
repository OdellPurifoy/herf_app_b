# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/deleted_membership
class DeletedMembershipPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/deleted_membership/notify
  def notify
    DeletedMembershipMailer.with(membership: membership, lounge: lounge).notify
  end

  private

  def membership
    Membership.last
  end

  def lounge
    Lounge.last
  end
end
