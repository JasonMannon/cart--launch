class Email < ActiveRecord::Base
  #include ActiveModel::Validations
  validates_presence_of :email
  after_create :send_confirmation_email


  private
  def send_confirmation_email2
    RestClient.post Rails.application.secrets.API_URL+"/messages",
      :from => "ev@example.com",
      :to => self.email,
      :subject => "This is subject",
      :text => "Text body",
      :html => "<b>HTML</b> version of the body!"
  end
end