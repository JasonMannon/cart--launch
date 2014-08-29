class UserMailer < ActionMailer::Base
  default from: "admin@cartwheelsapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @greeting = "Thanks for your intrest in the CartWheels beta!"

    mail to: user.email, subject: "Thanks for your interest in the CartWheels beta!"
  end
end
