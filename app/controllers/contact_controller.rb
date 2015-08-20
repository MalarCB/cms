class ContactController < ApplicationController
  layout 'application'
  def index
    breadcrumbs.add 'Contact', request.path
    @contact = Contact.new
  end

  def save
    @user = Contact.new(contact_params)
    @user.ipaddress = request.ip
    @user.status = true
    @user.save
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
