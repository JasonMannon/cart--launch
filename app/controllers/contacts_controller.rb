class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Your message has been sent!"
      redirect_to root_url
    else
      flash[:notice] = "There was an error, please try again."
      redirect_to root_url
    end
  end

  private 
  def contact_params
    params.require(:contact).permit(:email, :name, :description, :category)
  end
end