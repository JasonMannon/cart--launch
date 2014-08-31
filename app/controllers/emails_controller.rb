class EmailsController < ApplicationController
  def index
    @email = Email.new 
    @emails = Email.all
  end


  def create
    @email = Email.find_by_email(params[:email][:email]);
    if @email.nil?
      @email = Email.new(email_params)
      if @email.save
        redirect_to root_url
      else
        redirect_to root_url, notice: "There was an error, please try again!"
      end
    else
      redirect_to root_url, notice: "You have already signed up, Thanks!"
    end
  end

  private 
  def email_params
    params.require(:email).permit(:email)
  end
end