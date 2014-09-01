class Contact < ActiveRecord::Base
  after_create :send_contact_email

  private
  def send_contact_email
    RestClient.post Rails.application.secrets.API_URL+"/messages",
      :from => self.email,
      :to => "jmannonpdx@gmail.com",
      :subject => self.category,
      :text => self.description,
      :html => "<b>HTML</b> version of the body!"
  end
end