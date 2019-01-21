class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      format.html do
        if verify_recaptcha(model: @contact) && @contact.valid?
          ContactMailer.new_contact(@contact).deliver_now
          redirect_to new_contact_path,
            notice: I18n.t('contacts.create.flash')
        else
          render :new
        end
      end
      format.js do
        if verify_recaptcha(model: @contact) && @contact.valid?
          ContactMailer.new_contact(@contact).deliver_now
          @success = true
        end
        render :new
      end
    end
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:name, :telephone, :email, :message)
  end
end
