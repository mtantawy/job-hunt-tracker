# frozen_string_literal: true

require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "example@example.com", password: "letmein")
    @opportunity = Opportunity.create!(company_name: "Test Company", source_name: "name", source_link: "http://link")
    sign_in
  end

  def sign_in
    post(session_path(session: { email: "example@example.com", password: "letmein" }))
  end

  test "should create contact" do
    assert_difference("Contact.count") do
      post opportunity_contacts_path(@opportunity),
        params: { contact: { name: "Test Contact", email: "test@example.com" } }
    end

    assert_redirected_to opportunity_path(@opportunity)
  end

  test "should update contact" do
    contact = @opportunity.contacts.create!(name: "Test Contact")
    patch opportunity_contact_path(@opportunity, contact),
      params: { contact: { name: "New Contact Name" } }
    assert_redirected_to opportunity_path(@opportunity)
    assert_equal "New Contact Name", contact.reload.name
  end

  test "should destroy contact" do
    contact = @opportunity.contacts.create!(name: "Test Contact")
    assert_difference("Contact.count", -1) do
      delete opportunity_contact_path(@opportunity, contact)
    end

    assert_redirected_to opportunity_path(@opportunity)
  end
end
