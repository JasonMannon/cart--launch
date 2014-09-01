class EmailsController < ApplicationController
  def index
    @email = Email.new 
    @emails = Email.all
    @contact = Contact.new
  end


  def create
    @email = Email.find_by_email(params[:email][:email]);
    if @email.nil?
      @email = Email.new(email_params)
      if @email.save
        flash[:notice] = "Thanks for signing up!"
        redirect_to root_url
      else
        flash[:notice] = "There was an error, please try again."
        redirect_to root_url
      end
    else
      flash[:notice] = "You have already signed up, thanks for your interest!"
      redirect_to root_url
    end
  end

  private 
  def email_params
    params.require(:email).permit(:email)
  end
end