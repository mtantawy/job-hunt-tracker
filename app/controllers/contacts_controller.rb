# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :require_login
  before_action :set_contact, only: [:update, :destroy]

  def create
    @contactable.contacts.create!(contact_params)
    redirect_to(@contactable)
  end

  def update
    @contact.update!(contact_params)
    redirect_to(@contactable)
  end

  def destroy
    @contact.destroy
    redirect_to(@contactable)
  end

  private

  def contact_params
    params.require(:contact).permit(
      :name,
      :email,
      :phone,
      :link,
      :notes,
    )
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
