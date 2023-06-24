# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/member_canceled_event
class MemberCanceledEventPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/member_canceled_event/notify
  def notify
    MemberCanceledEventMailer.with(membership: membership, event: event).notify
  end

  private

  def membership
    Membership.last
  end

  def event
    Event.last
  end
end
