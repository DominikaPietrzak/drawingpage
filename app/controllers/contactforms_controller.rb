class ContactformsController < ApplicationController

  def new
    @contactform = Contactform.new
  end

  def create
    @contactform = Contactform.new(params[:contactform])
    @contactform.request = request
    if @contactform.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end
end
