class Email < ActiveRecord::Base
  after_create :send_confirmation_email

  private
  def send_confirmation_email
    UserMailer.signup_confirmation(self).deliver
  end
end