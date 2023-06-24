# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/member_update_event
class MemberUpdateEventPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/member_update_event/notify
  def notify
    MemberUpdateEventMailer.with(membership: membership, event: event).notify
  end

  private

  def membership
    Membership.last
  end

  def event
    Event.last
  end
end
