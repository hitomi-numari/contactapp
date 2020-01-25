class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if params[:back]
      render :new
    else
      if @contact.save
        redirect_to new_contact_path
      else
        render 'new'
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
