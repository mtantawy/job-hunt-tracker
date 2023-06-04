# frozen_string_literal: true

require "test_helper"

class ProcessStepsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "example@example.com", password: "letmein")
    @opportunity = Opportunity.create!(company_name: "Test Company", source_name: "name", source_link: "http://link")
    sign_in
  end

  def sign_in
    post(session_path(session: { email: "example@example.com", password: "letmein" }))
  end

  test "should create process step" do
    assert_difference("ProcessStep.count") do
      post opportunity_process_steps_path(@opportunity),
        params: { process_step: { title: "Test Process Step" } }
    end

    assert_redirected_to opportunity_path(@opportunity)
  end

  test "should update process step" do
    process_step = @opportunity.process_steps.create!(title: "Test Process Step")
    patch opportunity_process_step_path(@opportunity, process_step),
      params: { process_step: { title: "New Process Step Title" } }
    assert_redirected_to opportunity_path(@opportunity)
    assert_equal "New Process Step Title", process_step.reload.title
  end

  test "should destroy process step" do
    process_step = @opportunity.process_steps.create!(title: "Test Process Step")
    assert_difference("ProcessStep.count", -1) do
      delete opportunity_process_step_path(@opportunity, process_step)
    end

    assert_redirected_to opportunity_path(@opportunity)
  end
end
