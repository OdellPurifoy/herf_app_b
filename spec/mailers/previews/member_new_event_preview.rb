# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/member_new_event
class MemberNewEventPreview < ActionMailer::Preview
  def notify
    MemberNewEventPreview.with(membership: membership, event: event).notify
  end

  private

  def membership
    Membership.last
  end

  def event
    Event.last
  end
end
