class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      redirect_to new_contact_path, 
        notice: I18n.t('contacts.create.flash')
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:name, :telephone, :email, :message)
  end
end
