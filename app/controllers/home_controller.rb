class HomeController < ApplicationController
  def index
    @contact  = Contact.new
    breadcrumbs.add 'Home', request.path
  end

  def services
    breadcrumbs.add 'Services', request.path

  end



  def gallery
    breadcrumbs.add 'Gallery', request.path

  end


end
