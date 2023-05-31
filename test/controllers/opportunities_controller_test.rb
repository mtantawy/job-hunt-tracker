# frozen_string_literal: true

require "test_helper"

class OpportunitiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "example@example.com", password: "letmein")
  end

  def sign_in
    post(session_path(session: { email: "example@example.com", password: "letmein" }))
  end

  test "should get index" do
    get opportunities_path(as: @user)
    assert_response :success
  end

  test "should show opportunity" do
    get opportunity_path(opportunities(:one)), params: { as: @user.id }
    assert_response :success
  end

  test "should get new" do
    get new_opportunity_path, params: { as: @user.id }
    assert_response :success
  end

  test "should get edit" do
    get edit_opportunity_path(opportunities(:one)), params: { as: @user.id }
    assert_response :success
  end

  test "should create opportunity" do
    sign_in
    assert_difference("Opportunity.count") do
      post opportunities_path,
        params: { opportunity: { company_name: "Test Company", source_name: "name", source_link: "http://link" } }
    end

    assert_redirected_to opportunity_path(Opportunity.last)
  end

  test "should not create opportunity with invalid params" do
    sign_in
    assert_no_difference("Opportunity.count") do
      post opportunities_path, params: { opportunity: { company_name: nil } }
    end

    assert_response :unprocessable_entity
  end

  test "should update opportunity" do
    sign_in
    patch opportunity_path(opportunities(:one)),
      params: { opportunity: { company_name: "New Company Name" } }
    assert_redirected_to opportunity_path(opportunities(:one))
    assert_equal "New Company Name", opportunities(:one).reload.company_name
  end

  test "should not update opportunity with invalid params" do
    sign_in
    opportunities(:one).update!(company_name: "Test Company")
    patch opportunity_path(opportunities(:one)), params: { opportunity: { company_name: nil } }
    assert_response :unprocessable_entity
    assert_equal "Test Company", opportunities(:one).reload.company_name
  end

  test "should destroy opportunity" do
    sign_in
    assert_difference("Opportunity.count", -1) do
      delete opportunity_path(opportunities(:one))
    end

    assert_redirected_to opportunities_path
  end
end
