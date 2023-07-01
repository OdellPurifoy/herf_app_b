# Preview all emails at http://localhost:3000/rails/mailers/new_member_welcome
class NewMemberWelcomePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_member_welcome/send_welcome_email
  def send_welcome_email
    NewMemberWelcomeMailer.with(membership: membership, lounge: lounge).send_welcome_email
  end

  private

  def membership
    Membership.last
  end

  def lounge
    Lounge.last
  end
end
